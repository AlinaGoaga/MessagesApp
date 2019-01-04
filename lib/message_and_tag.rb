require 'data_mapper'

class Message
  include DataMapper::Resource

  property :id, Serial
  property :content, Text
  property :created_at, DateTime

  has n, :tags, :through => Resource

end

class Tag
  include DataMapper::Resource

  property :id, Serial
  property :tag_content, Text

  has n, :messages, :through => Resource

end
