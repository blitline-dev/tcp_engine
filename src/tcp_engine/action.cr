require "json"

# --------------------------------------
#
#  Generic implementation of an action
#  that can be performed. The TCP_LISTENER
#  sends data that it recieves via the
#  socker directly here. The Action can
#  perform logic on that data.
#
# ---------------------------------------
class Action
  def initialize
  end

  # For example purposes, just output data
  def process(socket : Socket, data : String)
    puts "Action is processing #{data}"
    socket.puts("OK")
  end
end
