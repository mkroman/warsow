# encoding: utf-8

module Warsow
  class Server
    attr_accessor :attributes

    def self.attr name, value; define_method(name) { @attributes["#{value}"] } end

    attr :map,         :mapname
    attr :type,        :gametype
    attr :players,     :clients
    attr :hostname,    :sv_hostname
    attr :max_players, :sv_maxclients

    def initialize host, port = 44400
      @host, @port = host, port

      @connection = Connection.new host, port
    end

    def connect
      @connection.establish
      @attributes = retrieve_attributes
    end

  private

    def retrieve_attributes
      @connection.transmit "\xFF\xFF\xFF\xFFgetinfo \x0A\x0D\x0F"
      @connection.read[18..-1].tap do |response|
        return Hash[*response.split('\\')]
      end
    end
  end
end
