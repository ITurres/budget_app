require 'rails_helper'

RSpec.describe 'home#index', type: :system do
  it 'displays the home page' do
    visit root_path

    expect(page).to have_content('My Budget')
  end

  it 'redirect to the log in page' do
    visit root_path

    click_link 'log in'

    expect(page).to have_current_path(new_user_session_path)
  end

  it 'redirect to the sign up page' do
    visit root_path

    click_link 'sign up'

    expect(page).to have_current_path(new_user_registration_path)
  end
end
