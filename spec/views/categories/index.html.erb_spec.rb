require 'rails_helper'

RSpec.describe 'Categories#index', type: :system do
  let(:user) { create(:user) }

  context 'index page navbar' do
    it 'displays the navbar content' do
      log_in(user)

      expect(page).to have_content('CATEGORIES')
      expect(page).to have_button('Sign Out')
    end

    it 'should sign out the user' do
      log_in(user)

      click_button('Sign Out')

      expect(page).to have_content('Signed out successfully')
    end
  end

  context 'index page categories list' do
    it 'should display the total expenses' do
      log_in(user)

      categories = create_list(:category, 3, user:)

      expect(page).to have_content('Total expenses')
      expect(page).to have_content(categories.sum(&:total_amount_spent))
    end

    it 'should display the categories list' do
      log_in(user)

      categories = create_list(:category, 3, user:)

      categories.each do |category|
        expect(page).to have_content(category.name)
        expect(page).to have_content(category.total_amount_spent)
        expect(page).to have_content(category.created_at.strftime('%d %b, %Y'))
      end
    end
  end
end
