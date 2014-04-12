require 'spec_helper.rb'

feature 'Looking up recipes', js: true do
  scenario 'finding recipes' do
    visit '/'
    fill_in 'keywords', with: 'with'
    click_on 'Search'

    expect(page).to have_content('Watermelon with Salt')
    expect(page).to have_content('Dried Mango with Fresh Mango')
  end
end
