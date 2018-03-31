require 'rails_helper'

describe 'A visitor' do
  context 'can visit the homepage' do
    it 'and click a link to create an account' do
      visit '/'

      click_on 'Sign Up for an Account'
      fill_in 'Username', with: 'giffymcgifferson'
      fill_in 'Password', with: 'supersecret'
      click_on 'Create Account'

      expect(current_path).to eq("/users/#{User.last.id}")
      expect(page).to have_content("giffymcgifferson")
    end
    it 'and it cant create an account with a username thats already in use' do
      user = create(:user)
      visit '/'

      click_on 'Sign Up for an Account'
      fill_in 'Username', with: user.username
      fill_in 'Password', with: 'supersecret'
      click_on 'Create Account'

      expect(current_path).to eq('/users/new')
      expect(page).to have_content('Sorry, that username has been taken.')
    end
  end
end
