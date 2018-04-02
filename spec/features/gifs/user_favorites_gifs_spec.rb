require 'rails_helper'
  describe 'A logged-in user' do
    it 'can see all gifs' do
      user = create(:user)
      gif_1 = create(:gif)
      gif_2 = create(:gif)

      visit '/login'

      fill_in 'Username', with: user.username
      fill_in 'Password', with: user.password
      click_on 'Log In'

      click_on 'Gifs'
      img = find('img[src="gif_1.image_path"]')
      expect(page).to have_content(img)
      expect(page).to have_content(gif_2.image_path)
    end
    it 'and mark their favorites to see in their favorites list' do

    end
  end
