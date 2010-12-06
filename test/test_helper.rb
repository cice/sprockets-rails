lib_dir = File.join File.dirname(__FILE__), '..', 'lib'
$:.unshift lib_dir

require 'rubygems'
require 'test/unit'
require 'active_support'
require 'mocha'

class ActiveSupport::TestCase
end
