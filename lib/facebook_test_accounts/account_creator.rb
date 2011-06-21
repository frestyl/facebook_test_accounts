module FacebookTestAccounts
  class AccountCreator
    
    include HTTParty
    base_uri "https://graph.facebook.com"
    
    def initialize(options = { })
      @app_id      = options[:app_id]
      @secret      = options[:secret]
      @installed   = options[:installed]
      @permissions = options[:permissions]
    end
    
    def create_account
      print_account_info(create_test_account(fetch_access_token))
    end
    
    def fetch_access_token
      
      response = self.class.get(
        "/oauth/access_token", 
        :query => { 
          :client_id     => @app_id, 
          :client_secret => @secret, 
          :grant_type    => "client_credentials" 
        }
      )
      
      if response.code != 200
        FacebookTestAccounts.die("unable to fetch access token: #{response['error']['message']}")
      end
      
      unless match = response.match(/^access_token\=(.+)$/)
        FacebookTestAccounts.die("unable to fetch access token: token not present in response.")
      end
      
      return match[1]
    end
    
    def create_test_account(access_token)
      response = self.class.get(
        "/#{@app_id}/accounts/test-users", 
        :query => { 
          :installed    => @installed,
          :permissions  => @permissions,
          :method       => "post",
          :access_token => access_token
        }
      )
      
      unless response.code == 200
        FacebookTestAccounts.die("unable to create test account: #{response['error']['message']}")
      end
      
      return response
    end
    
    def print_account_info(response)
      
      info = ""
      
      info << ""                                     + "\n"
      info << "       id:\t#{response['id']}"        + "\n"  
      info << "login_url:\t#{response['login_url']}" + "\n"
      info << "    email:\t#{response['email']}"     + "\n"
      info << " password:\t#{response['password']}"  + "\n"
      info << ""                                     + "\n"
      
      $stdout.puts(info)
    end
  end
end