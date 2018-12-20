# require_relative 'message'
# require 'pg'

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

  def self.all
    connection = PG.connect(dbname: 'messages_manager')
    result = connection.exec('SELECT * FROM messages;')
    result.map { |message| message['text'] }
  end
end
