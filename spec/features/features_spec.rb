feature 'Header' do
  scenario 'check setup is working and header is visible' do
    visit('/')
    expect(page).to have_content('My messenger app')
  end
end

feature 'New message' do
  scenario 'user is allowed to create a new message' do
    open_page_fill_in
    expect(page).to have_content("Insert message here:")
    expect(page).to have_content('I love programming')
  end
end

feature 'Time stamp' do

  before do
    Timecop.freeze(Time.local(2018,12,17,15,10,0))
  end

  after do
    Timecop.return
  end

  scenario "Time is saved and shown with new message" do
    open_page_fill_in
    expect(page).to have_content('I love programming : 2018-12-17 15:10:00 +0000')
  end
end
