def fill_in_msg
  visit '/'
  fill_in :content, with: 'I love summer!'
  click_button 'Submit'
end

def add_tags
  fill_in_msg
  click_on 'I love summer!'
  fill_in :tag_content, with: 'Love'
  click_button 'Submit'
  click_on 'I love summer!'
  fill_in :tag_content, with: 'Season'
  click_button 'Submit'
end
