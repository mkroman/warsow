# encoding: utf-8

module Warsow
  class Connection
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
      @socket.send data, 0
    end
  end
end
