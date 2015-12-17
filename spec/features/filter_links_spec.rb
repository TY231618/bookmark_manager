feature 'filtering of tags' do

  scenario 'allows user to filter tags' do
    visit('/links/new')
    fill_in('title', with: 'West Ham')
    fill_in('url', with: 'http://www.hammers.com')
    fill_in('tag', with: 'bubbles')

    click_button('Create New')
    visit('/links/tags/bubbles')
    expect(page).to have_content('bubbles')
  end
end
