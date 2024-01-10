module LoginHelper
  def log_in(user)
    visit new_user_registration_path

    fill_in 'Full Name', with: user.name
    fill_in 'Email', with: user.email
    fill_in 'Password, 6 characters minimum', with: 'password'
    fill_in 'Confirm Password', with: 'password'

    click_button 'Next'

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
  end
end
