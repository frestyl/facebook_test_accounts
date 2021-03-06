require 'trollop'
require 'httparty'
require 'facebook_test_accounts/account_creator'
require 'facebook_test_accounts/bin'

module FacebookTestAccounts
  def self.die(msg, status = 1)
    $stderr.puts "\n\n#{$0.split(/\//).last}: #{msg}\n"
    exit(status)
  end
end
