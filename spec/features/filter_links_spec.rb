feature 'filtering of tags' do
  # As a time-pressed user
  # So that I can quickly find links on a particular topic
  # I would like to filter links by tag
  scenario 'allows user to filter tags' do
    visit('/links/new')
    fill_in('title', with: 'West Ham')
    fill_in('url', with: 'http://www.hammers.com')
    fill_in('tag', with: 'bubbles')

    click_button('Create New')
    visit('/links/bubbles')
    expect(page).to have_content('bubbles')
  end

  # As a time-pressed user
  # So that I can organise my links into different categories for ease of search
  # I would like to add tags to the links in my bookmark manager
  scenario 'allows user to add multiple tags to a link' do
    visit('/links/new')
    fill_in('title', with: 'Jose')
    fill_in('url', with: 'http://www.bbc.co.uk/sport/0/football/34670192')
    fill_in('tag', with: 'football sacked')

    click_button('Create New')
    link = Link.first
    expect(link.tags.map(&:tag)).to include('football', 'sacked')
  end
end
