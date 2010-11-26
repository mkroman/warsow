# encoding: utf-8

module Warsow
  class Server
    attr_accessor :attributes

    def initialize host, port = 44400
      @host, @port = host, port

      @connection = Connection.new host, port
    end

    def connect
      @connection.establish
      @attributes = information
    end

    def information
      @connection.transmit "\xFF\xFF\xFF\xFFgetinfo \x0A\x0D\x0F"
      @connection.read[18..-1].tap do |response|
        return Hash[*response.split('\\')]
      end
    end
  end
end
