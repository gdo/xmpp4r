#  XMPP4R - XMPP Library for Ruby
#  Copyright (C) 2004 Lucas Nussbaum <lucas@lucas-nussbaum.net>
#  Released under GPL v2 or later

require 'socket'
require 'thread'
require 'xmpp4r/stream'

module Jabber
  ##
  # The connection class manages the TCP connection to the Jabber server
  #
  class Connection  < Stream
    attr_reader :host, :port, :input, :output

    ##
    # Create a new connection to the given host and port, using threaded mode
    # or not.
    def initialize(host, threaded = true, port=5222)
      super(threaded)
      @host = host
      @port = port
    end

    ##
    # Connects to the Jabber server through a TCP Socket and
    # starts the Jabber parser.
    #
    def connect
      @socket = TCPSocket.new(@host, @port)
      start(@socket)
    end
  end  
end
