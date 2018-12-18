require_relative 'message'

class MessageHistory
  attr_reader :list

  def initialize
    @list = []
  end

  def add_to_list(message = Message.new(text))
    @list << { 'text' => message.text, 'time' => message.time }
  end
end
