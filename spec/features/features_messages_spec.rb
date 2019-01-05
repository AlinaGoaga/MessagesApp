# feature 'Header' do
#   scenario 'check setup is working and header is visible' do
#     visit('/')
#     expect(page).to have_content('My messenger app')
#   end
# end
#
# feature 'New message' do
#   scenario 'user is allowed to create a new message' do
#     open_page_fill_in
#     expect(page).to have_content('Insert message here:')
#     expect(page).to have_content('I love programming')
#   end
# end
#
# feature 'Time stamp' do
#   before do
#     Timecop.freeze(Time.local(2018, 12, 17, 15, 10, 0))
#   end
#
#   after do
#     Timecop.return
#   end
#
#   scenario 'Time is saved and shown with new message' do
#     open_page_fill_in
#     expect(page).to have_content("I love programming\n2018-12-17 15:10:00 +0000")
#   end
# end
#
# feature 'Multiple messages' do
#   scenario 'user is able to submit and view multiple messages' do
#     Timecop.freeze(Time.local(2018, 12, 17, 15, 10, 0))
#     open_page_fill_in
#     Timecop.return
#     Timecop.freeze(Time.local(2018, 12, 17, 16, 10, 0))
#     fill_in 'message', with: 'I love swimming'
#     click_button 'Submit'
#     expect(page).to have_content("I love programming\n2018-12-17 15:10:00 +0000")
#     expect(page).to have_content("I love swimming\n2018-12-17 16:10:00 +0000")
#   end
# end
#
# feature 'Show individual message' do
#   scenario 'show individual message when user clicks on the message text' do
#     open_page_fill_in
#     fill_in 'message', with: 'I love swimming'
#     click_button 'Submit'
#     click_link 'I love swimming'
#     expect(page).to have_content('I love swimming')
#   end
# end

RSpec.feature 'Messages' do
  context 'Creating' do
    scenario 'A user can submit text and see it with a timestamp' do
      fill_in_msg
      expect(page).to have_content 'I love summer!'
    end

    scenario 'A user can submit text and it redirects back to the index' do
      fill_in_msg
      expect(page.current_path).to eq('/')
    end

    scenario 'A user can submit many messages and see them all' do
      fill_in_msg
      fill_in :content, with: 'I love life!'
      click_button 'Submit'
      fill_in :content, with: 'I love nature!'
      click_button 'Submit'
      expect(page).to have_content 'I love summer!'
      expect(page).to have_content 'I love life!'
      expect(page).to have_content 'I love nature!'
    end
  end

  context 'Seeing a message' do
    scenario 'click on a message shows the full text of the message' do
      message = Message.create(content: 'Create message in db!')
      visit '/'
      trunchiated_message = 'Create message in db!'[0..19]
      click_on trunchiated_message
      expect(page.current_path).to eq("/messages/#{message.id}")
      expect(page).to have_content('Create message in db!')
    end
  end

  context 'Editing a message' do
    scenario 'A user can edit a message that he has submitted' do
      message = Message.create(content: 'Good morning!')
      visit '/'
      click_on 'Good morning!'
      click_on 'Edit message'
      fill_in :content, with: 'Good evening!'
      click_on 'Submit'
      expect(page.current_path).to eq("/")
      expect(page).to have_content 'Good evening!'
    end
  end

  context 'Deleting a message' do
    scenario 'A user can delete a message that he has submitted' do
      message = Message.create(content: 'Good morning!')
      visit '/'
      click_on 'Good morning!'
      click_on 'Delete message'
      expect(page.current_path).to eq("/")
      expect(page).to have_no_content("Good morning!")
    end
  end

end
