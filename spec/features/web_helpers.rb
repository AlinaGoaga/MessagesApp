def fill_in_msg
  visit '/'
  fill_in :content, with: 'I love summer!'
  click_button 'Submit'
end
