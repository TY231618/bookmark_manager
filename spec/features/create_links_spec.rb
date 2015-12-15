feature 'creating links' do

  scenario 'to add a link using a form' do
    # As a time-pressed user
    # So that I can save a website
    # I would like to add the site's address and title to my bookmark manager

    #Link.create(url: 'http:www.google.com', title: 'Google')

    visit('/links/new')
    fill_in('title', with: 'Yahoo')
    fill_in('url', with: 'http://www.yahoo.com')
    click_button('Create New')
    # expect(page.status_code).to eq 200
    # within 'ul#links' do
    expect(page).to have_content('Yahoo')
  end

end
