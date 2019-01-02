require 'data_mapper'

class Message
  include DataMapper::Resource

  property :id, Serial
  property :content, Text
  property :created_at, DateTime

  has n, :tags

end

class Tag
  include DataMapper::Resource

  property :tag_id, Serial
  property :tag_content, Text

  belongs_to :message

end
