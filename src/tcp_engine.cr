require "./tcp_engine/*"

class TcpEngine
  VERSION = "0.1.0"

  # TODO: Put your code here
  def self.start
    port = ENV["TCP_PORT"]? || "6768"
    stats_port = ENV["STATS_TCP_PORT"]? || "6770"
    listen = ENV["LISTEN"]? || "0.0.0.0"
    debug = ENV["DEBUG"]?.to_s == "true"

    puts "Starting TCP Engine"
    puts "TCP listening on #{listen}:#{port}"
    if debug
      puts "Debug Mode"
    end
    server = TcpListener.new(listen, port.to_i, debug)
    server.listen
  end
end

TcpEngine.start
