require_relative 'message'

class MessageHistory
  attr_reader :list

  def initialize
    @list = []
  end

  def add_to_list(message)
    @list << { 'text' => message.text, 'time' => message.time, 'id' => message.id }
  end

  def find(id)
    message = @list.find { |msg| msg['id'] == id }
    message['text']
  end
end
