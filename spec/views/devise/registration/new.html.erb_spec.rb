require 'rails_helper'

RSpec.describe 'devise#registration#new', type: :system do
  context 'when user has completed the registration form' do
    it "redirects to the user's categories page" do
      visit root_path
      click_link 'sign up'

      fill_in 'Full Name', with: 'John Doe'
      fill_in 'Email', with: 'example@gmail.com'
      fill_in 'Password, 6 characters minimum', with: 'password'
      fill_in 'Confirm Password', with: 'password'

      click_button 'Next'

      expect(page).to have_current_path('/') # ? = categories_path
    end
  end
end
