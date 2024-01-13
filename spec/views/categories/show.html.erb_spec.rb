require 'rails_helper'

RSpec.describe 'Categories#show', type: :system do
  let(:user) { create(:user) }

  it 'displays the category show page' do
    log_in(user)

    category = create(:category, user:)

    visit category_path(category)

    expect(page).to have_content('TRANSACTIONS')
  end

  it 'displays the category edit and delete buttons' do
    log_in(user)

    category = create(:category, user:)

    visit category_path(category)

    expect(page).to have_link('edit category')
    expect(page).to have_button('delete category')
  end

  context 'when edit category button is clicked' do
    it 'displays the category edit page' do
      log_in(user)

      category = create(:category, user:)

      visit category_path(category)

      click_link('edit category')

      expect(page).to have_content('ADD A NEW CATEGORY')
    end
  end

  context 'when delete category button is clicked' do
    it 'displays "Category deleted!" flash message' do
      log_in(user)

      category = create(:category, user:)

      visit category_path(category)

      click_button('delete category')

      expect(page).to have_content('Category deleted!')
    end
  end

  it 'displays the category transactions list' do
    log_in(user)

    category = create(:category, user:)
    transactions = create_list(:transaction_detail, 3, name: 'test', amount: 1000, user:)
    create(:category_transaction_detail, category:, transaction_detail: transactions[0])

    visit category_path(category)

    transactions.each do |transaction|
      expect(page).to have_content(transaction.name)
      expect(page).to have_content('$1,000.00')
      expect(page).to have_content(transaction.created_at.strftime('%d %b, %Y'))
      expect(page).to have_button('delete')
    end
  end

  context 'when transaction delete button is clicked' do
    it 'displays "Transaction deleted!" flash message' do
      log_in(user)

      category = create(:category, user:)
      transactions = create_list(:transaction_detail, 3, name: 'test', amount: 1000, user:)
      create(:category_transaction_detail, category:, transaction_detail: transactions[0])

      visit category_path(category)

      click_button('delete', wait: 10)

      expect(page).to have_content('Transaction deleted!')
    end
  end
end
