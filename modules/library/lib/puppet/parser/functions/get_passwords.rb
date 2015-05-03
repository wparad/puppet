require 'json'

module Puppet::Parser::Functions
  newfunction(:get_passwords, :type => :rvalue) do |args|
	filename = '/passwords.json'
	raise '/passwords.json file does exist' if !File.exist?(filename)
	JSON::parse(File.read(filename))
  end
end
