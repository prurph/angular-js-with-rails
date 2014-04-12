require 'spec_helper.rb'

feature 'Looking up recipes', js: true do
  before do
    Recipe.create!(name: 'Watermelon with Salt')
    Recipe.create!(name: 'Dried Mango with Fresh Mango and Frozen Mango')
    Recipe.create!(name: 'Spinach and Parmesan Omelete')
    Recipe.create!(name: 'Steamed Haitatoes')
  end

  scenario 'finding recipes' do
    visit '/'
    fill_in 'keywords', with: 'with'
    click_on 'Search'

    expect(page).to have_content('Watermelon with Salt')
    expect(page).to have_content('Dried Mango with Fresh Mango')
  end
end
