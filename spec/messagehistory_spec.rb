require 'messagehistory'

describe MessageHistory do
  subject(:messagehistory) { MessageHistory.new }
  let(:message1) { double :message, text: 'I love programming', time: '2018-12-17 15:10:00 +0000' }
  let(:message2) { double :message, text: 'I love swimming', time: '2018-12-17 16:10:00 +0000' }

  describe '#add_to_list' do
    it 'adds a new message to the list of messages' do
      expect(messagehistory.add_to_list(message1)).to eq([{ message1.text => message1.time }])
    end
  end

  describe '#list' do
    it 'returns the list of messages' do
      messagehistory.add_to_list(message1)
      messagehistory.add_to_list(message2)
      expect(messagehistory.list).to eq [{ message1.text => message1.time }, { message2.text => message2.time }]
    end
  end
end
