require 'pry'

RSpec.feature 'Tags' do
  context 'Creating' do
    scenario 'A user can attach a tag to a message and it gets redirected to the index page' do
      fill_in_msg
      click_on 'I love summer!'
      fill_in :tag_content, with: 'Love!'
      click_button 'Submit'
      expect(page).to have_content 'Love'
      expect(page.current_path).to eq('/')
    end
  end

end
