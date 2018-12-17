feature 'Header' do
  scenario 'check setup is working and header is visible' do
    visit('/')
    expect(page).to have_content('My messenger app')
  end
end

feature 'New message' do
  scenario 'user is allowed to create a new message' do
    open_page_fill_in
    expect(page).to have_content('Insert message here:')
    expect(page).to have_content('I love programming')
  end
end

feature 'Time stamp' do
  before do
    Timecop.freeze(Time.local(2018, 12, 17, 15, 10, 0))
  end

  after do
    Timecop.return
  end

  scenario 'Time is saved and shown with new message' do
    open_page_fill_in
    expect(page).to have_content("I love programming\n2018-12-17 15:10:00 +0000")
  end
end

feature 'Multiple messages' do
  scenario 'user is able to submit and view multiple messages' do
    Timecop.freeze(Time.local(2018, 12, 17, 15, 10, 0))
    open_page_fill_in
    Timecop.return
    Timecop.freeze(Time.local(2018, 12, 17, 16, 10, 0))
    fill_in 'message', with: 'I love swimming'
    click_button 'Submit'
    expect(page).to have_content("I love programming\n2018-12-17 15:10:00 +0000")
    expect(page).to have_content("I love swimming\n2018-12-17 16:10:00 +0000")
  end
end
