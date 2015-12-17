feature 'adding tags' do

  # As a time-pressed user
  # So that I can organise my many links into different categories for ease of search
  # I would like to tag links in my bookmark manager
  scenario 'to add a tag to a link using a form' do

    visit('/links/new')
    fill_in('title', with: 'Facebook')
    fill_in('url', with: 'http://www.facebook.com')
    fill_in('tag', with: 'social')

    click_button('Create New')
    link = Link.first
    expect(link.tags.map(&:tag)).to include('social')
  end

end
