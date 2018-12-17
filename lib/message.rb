require 'time'

class Message
  attr_reader :text, :time

  def initialize(text)
    @text = text
    @time = Time.now.to_s
  end
end
