require 'spec_helper'

feature 'Creating, editing and deleting a recipe', js: true do
  scenario 'CRUD a recipe' do
    visit '/'
    click_on 'New Recipe...'

    fill_in 'name', with: 'Baked Brussel Sprouts'
    fill_in 'instructions', with: 'Slather in oil, then bake for 20 minutes'

    click_on 'Save'

    expect(page).to have_content('Baked Brussel Sprouts')
    expect(page).to have_content('Slather in oil, then bake for 20 minutes')

    click_on 'Edit'

    fill_in 'name', with: 'Roasted Brussel Sprouts'
    fill_in 'instructions', with: 'Slather in oil, then roast for 20 minutes'

    click_on 'Save'

    expect(page).to have_content('Roasted Brussel Sprouts')
    expect(page).to have_content('Slather in oil, then roast for 20 minutes')

    visit '/'
    fill_in 'keywords', with: 'Roasted'
    click_on 'Search'

    click_on 'Roasted Burssel Sprouts'

    click_on 'Delete'

    expect(Recipe.find_by_name('Roasted Brussel Sprouts')).to be_nil

  end
end
