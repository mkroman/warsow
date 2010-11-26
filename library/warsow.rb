# encoding: utf-8

require 'socket'
require 'warsow/server'
require 'warsow/connection'

module Warsow
  class << Version = [1,0]
    def to_s; join ?. end
  end

module_function

  def connect host, port = 44400
    Server.new(host, port).tap do |this|
      this.connect

      yield this if block_given?
    end
  end
end
