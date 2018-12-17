feature 'Header' do
  scenario 'check setup is working and header is visible' do
    visit('/')
    expect(page).to have_content('My messenger app')
  end
end

feature 'New message' do
  scenario 'user is allowed to create a new message' do
    visit('/')
    expect(page).to have_content("Insert message here:")
    fill_in 'message', with: 'I love programming'
    click_button "Submit"
    expect(page).to have_content('I love programming')
  end
end
