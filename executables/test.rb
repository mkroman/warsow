# encoding: utf-8

$:.unshift File.dirname(__FILE__) + '/../library'
require 'warsow'

Warsow.connect 'tastyspleen.tv' do |server|
  puts "Hostname: #{server.attributes['sv_hostname']}"
end
