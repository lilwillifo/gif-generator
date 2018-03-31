require 'rails_helper'

describe 'A user with an account' do
  it 'can link to login from home page' do
    user = create(:user)

    visit '/'

    click_on 'I already have an account'

    expect(current_path).to eq(login_path)
    fill_in 'username', with: user.username
    fill_in 'password', with: user.password

    click_on 'Log In'

    expect(current_path).to eq(user_path(user))

    expect(page).to have_content("Welcome, #{user.username}")
    expect(page).to have_content('Logout')
  end
end
