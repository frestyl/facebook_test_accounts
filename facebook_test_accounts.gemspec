# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "facebook_test_accounts/version"

Gem::Specification.new do |s|
  s.name        = "facebook_test_accounts"
  s.version     = FacebookTestAccounts::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Peter Brindisi", "frestyl"]
  s.email       = ["npj@frestyl.com", "info@frestyl.com"]
  s.homepage    = ""
  s.summary     = %q{Easily create test accounts for your facebook app}
  s.description = %q{Easily create test accounts for your facebook app}

  s.rubyforge_project = "facebook_test_accounts"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_dependency("trollop")
  s.add_dependency("httparty")
end
