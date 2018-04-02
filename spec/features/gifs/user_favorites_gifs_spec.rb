require 'rails_helper'
  describe 'A logged-in user' do
    it 'can see all gifs' do
      user = create(:user)
      category = create(:category)
      gif_1 = create(:gif, category: category)
      gif_2 = create(:gif, category: category)

      visit '/login'

      fill_in 'Username', with: user.username
      fill_in 'Password', with: user.password
      click_on 'Log In'

      click_on 'Gifs'
      expect(page).to have_xpath("//img[contains(@src,'#{gif_1.image_path}')]")
      expect(page).to have_xpath("//img[contains(@src,'#{gif_2.image_path}')]")
    end
    it 'and mark their favorites to see in their favorites list' do

    end
  end
