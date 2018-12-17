def open_page_fill_in
  visit('/')
  fill_in 'message', with: 'I love programming'
  click_button "Submit"
end
