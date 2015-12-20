require 'web_helper'

feature 'user sign up' do
  scenario 'I can sign up as a new user' do

    expect {sign_up}.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, joe_bloggs@yahoo.com')
    expect(User.first.email).to eq('joe_bloggs@yahoo.com')
  end
end