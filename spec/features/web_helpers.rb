def fill_in_msg
  visit '/'
  fill_in :content, with: 'I love summer!'
  click_button 'Submit'
end

def add_tags
  fill_in_msg
  fill_in :tag_content, with: 'Love'
  click_button 'Done'
  fill_in :tag_content, with: 'Season'
  click_button 'Done'
end
