require 'rails_helper'

RSpec.describe 'Categories#new', type: :system do
  let(:user) { create(:user) }

  it 'displays the new category page' do
    log_in(user)

    visit new_category_path

    expect(page).to have_content('ADD A NEW CATEGORY')
    expect(page).to have_button('Add')
  end

  it 'creates a new category' do
    log_in(user)

    visit new_category_path

    fill_in 'Name', with: 'New category'
    fill_in 'You expended it at... E.g. Apple', with: 'icon'
    click_button 'Add'

    expect(page).to have_content('Category created!')
  end
end
