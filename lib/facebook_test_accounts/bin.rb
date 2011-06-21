module FacebookTestAccounts
  class Bin
    def self.run
      AccountCreator.new(parseopts).create_account
    end
    
    private
    
    def self.parseopts
      opts = Trollop::options do
        
        opt :app_id,      "your facebook application id",     :type => :string
        opt :secret,      "your facebook application secret", :type => :string
        
        opt :installed,   "whether the new test user has already installed your app", :default => true
        opt :permissions, "a comma-separated list of extended permissions (http://developers.facebook.com/docs/authentication/permissions). your app is granted these permissions for the new test user if installed is true.", :default => "publish_stream"
      end
      
      Trollop::die :app_id, "must be specified" unless opts[:app_id]
      Trollop::die :secret, "must be specified" unless opts[:secret]
      
      return opts
    end
  end
end