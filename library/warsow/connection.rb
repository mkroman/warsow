# encoding: utf-8

module Warsow
  class Connection
    Header = [0xFF, 0xFF, 0xFF, 0xFF].pack 'C*'

    def initialize host, port
      @host, @port = host, port
      @socket = UDPSocket.new
    end

    def establish
      @socket.connect @host, @port
    end

    def read
      @socket.recvfrom(1024)[0]
    end

    def transmit data
      @socket.send Header + data, 0
    end
  end
end
