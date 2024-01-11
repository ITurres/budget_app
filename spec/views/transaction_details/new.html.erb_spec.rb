require 'rails_helper'

RSpec.describe 'TransacionDetails#new', type: :system do
  let(:user) { create(:user) }

  it 'displays the new category page' do
    log_in(user)

    visit new_transaction_detail_path

    expect(page).to have_content('NEW TRANSACTION')
    expect(page).to have_button('Add')
  end

  it 'creates a new transaction' do
    category = create(:category, user:)
    log_in(user)

    visit new_transaction_detail_path

    fill_in 'Name - max 40 characters', with: 'New Transaction', exact: true
    fill_in '$ Amount expended', with: 100, exact: true
    select(category.name, from: 'transaction_detail_category_id')

    click_button 'Add'

    expect(page).to have_content('Transaction created!')
  end
end
