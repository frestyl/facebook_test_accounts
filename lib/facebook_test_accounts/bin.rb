module FacebookTestAccounts
  class Bin
    
    def initialize
      opts = parseopts
      
      puts "opts: #{opts.inspect}"
    end
    
    def self.run
      self.new
    end
    
    private
    
    def parseopts
      opts = Trollop::opts do
        opt :app_id,      "your facebook application id"
        opt :secret,      "your facebook application secret"
        opt :installed,   "whether the new test user has already installed your app", :default => true
        opt :permissions, "a comma-separated list of extended permissions (http://developers.facebook.com/docs/authentication/permissions). your app is granted these permissions for the new test user if installed is true.", :default => "publish_stream"
      end
      
      Trollop::die :app_id, "must be specified" unless opts[:app_id]
      Trollop::die :secret, "must be specified" unless options[:secret]
      
      return opts
    end
  end
end