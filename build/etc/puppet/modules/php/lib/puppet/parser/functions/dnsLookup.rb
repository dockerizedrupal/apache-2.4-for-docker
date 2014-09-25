require 'resolv'

module Puppet::Parser::Functions
  newfunction(:dnsLookup, :type => :rvalue) do |args|
    return Resolv.getaddress(args[0]).to_s rescue nil
  end
end
