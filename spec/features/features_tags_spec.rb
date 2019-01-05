RSpec.feature 'Tags' do
  context 'Creating' do
    scenario 'A user can attach multiple tags to a message and it gets redirected to the index page' do
      add_tags
      expect(page).to have_content 'Love'
      expect(page).to have_content 'Season'
      expect(page.current_path).to eq('/')
    end
  end

  context 'Messages sharing a tag' do
    scenario 'A user can click on a tag and it shows all the messages that share that tag' do
      add_tags
      fill_in :content, with: 'I love winter!'
      click_button 'Submit'
      find_all("[name=tag_content]").first.fill_in with: 'Season'
      find_all("[value=Done]").first.click
      click_on('Season', :match => :first)
      expect(page).to have_content 'I love summer!'
      expect(page).to have_content 'I love winter!'
    end
  end

end
