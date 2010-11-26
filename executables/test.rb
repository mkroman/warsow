#!/usr/bin/env ruby
# encoding: utf-8

$:.unshift File.dirname(__FILE__) + '/../library'
require 'warsow'

Warsow.connect 'maero.dk', 44400, rcon: 'lol1234' do |server|
  puts "Hostname: #{server.hostname}"

  server.rcon 'sv_hostname "nigger saedd"'
end
