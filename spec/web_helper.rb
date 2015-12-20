

def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email,    with: 'joe_bloggs@yahoo.com'
  fill_in :password, with: 'bloggsey'
  click_button 'Sign Up'
end
