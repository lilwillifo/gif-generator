require 'rails_helper'

describe 'A logged-in user' do
  it 'can logout from their homepage' do
    user = create(:user)

    visit '/login'

    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_on 'Log In'

    click_on 'Logout'
    
    expect(page).to have_content('Successfully logged out!')
    expect(current_path).to eq('/')
  end
end
