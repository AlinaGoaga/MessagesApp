require 'time'

class Message
  attr_reader :text, :time, :id

  def initialize(text, id)
    @text = text
    @time = Time.now.to_s
    @id = id
  end
end
