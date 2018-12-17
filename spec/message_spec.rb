require 'message'

describe Message do
  subject(:message) { described_class.new('I love programming') }

  describe '#text' do
    it 'returns the message text' do
      expect(subject.text).to eq 'I love programming'
    end
  end
end
