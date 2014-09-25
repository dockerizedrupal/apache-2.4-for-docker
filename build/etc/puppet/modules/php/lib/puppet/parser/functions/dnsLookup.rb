require 'resolv'

module Puppet::Parser::Functions
  newfunction(:dnsLookup, :type => :rvalue) do |args|
    result = '127.0.0.1'
    result = Resolv.getaddress(args[0])
    return result
  end
end
