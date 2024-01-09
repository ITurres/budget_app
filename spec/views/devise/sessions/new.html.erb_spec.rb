require 'rails_helper'

RSpec.describe 'devise#sessions#new', type: :system do
  before do
    User.create!(name: 'John Doe', email: 'example@gmail.com', password: 'password')
  end

  context 'when user has completed the login form' do
    it "redirects to the user's categories page" do
      visit root_path
      click_link 'log in'

      fill_in 'Email', with: 'example@gmail.com'
      fill_in 'Password', with: 'password'

      click_button 'Log in'

      expect(page).to have_current_path('/') # ? = categories_path
    end
  end
end
