require "socket"

ITERATIONS = 10000

class Bench
  def get_stats
    client = TCPSocket.new("localhost", 6768)
    client << "stats\n"
    client.gets
  end

  def test_client
    client = TCPSocket.new("localhost", 6768)
    1.upto(ITERATIONS) do |index|
      client << "message\n"
      response = client.gets
      # Could do something with response
    end
  end

  def run
    puts
    puts "Starting Stats:"
    puts get_stats
    puts "-" * 50
    puts
    t = Time.utc
    test_client
    span_delta = Time.utc - t
    puts "Total time = #{span_delta}"
    puts "Total iterations = #{ITERATIONS}"
    puts "TPS = #{ITERATIONS.to_f / span_delta.to_f}"
    puts "-" * 50
    puts get_stats
  end
end

Bench.new.run
