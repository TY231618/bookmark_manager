
feature 'viewing links' do

# As a time-pressed user
# So that I can quickly go to web sites I regularly visit
# I would like to see a list of links on the homepage
  scenario 'to see a list of links' do
    Link.create(url: 'http:www.google.com', title: 'Google')

    visit('/links')

    expect(page.status_code).to eq 200
    within 'ul#links' do
      expect(page).to have_content('Google')
    end
  end

end
