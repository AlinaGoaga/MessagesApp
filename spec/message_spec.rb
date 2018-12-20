# require 'message'

# describe Message do
#   before do
#     Timecop.freeze(Time.local(2018, 12, 17, 15, 10, 0))
#   end
#
#   after do
#     Timecop.return
#   end
#
#   subject(:message) { described_class.new('I love programming', 1) }
#
#   describe '#text' do
#     it 'returns the message text' do
#       expect(subject.text).to eq 'I love programming'
#     end
#   end
#
#   describe '#time' do
#     it 'returns the timestamp' do
#       expect(subject.time).to eq '2018-12-17 15:10:00 +0000'
#     end
#   end
#
#   describe '#id' do
#     it 'returns the message id' do
#       expect(subject.id).to eq 1
#     end
#   end
# end
