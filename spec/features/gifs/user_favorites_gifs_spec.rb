require 'rails_helper'
  describe 'A logged-in user' do
    it 'can see all gifs' do
      user = create(:user)
      category = create(:category)
      gif_1 = create(:gif, category: category)
      gif_2 = create(:gif, category: category)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit gifs_path

      expect(page).to have_xpath("//img[contains(@src,'#{gif_1.image_path}')]")
      expect(page).to have_xpath("//img[contains(@src,'#{gif_2.image_path}')]")
    end
    it 'and mark their favorites to see in their favorites list' do
      user = create(:user)
      category = create(:category)
      gif_1 = create(:gif, category: category)
      gif_2 = create(:gif, category: category)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      within ".#{gif_1.image_path}" do
        find('far fa-heart').click
      end

      expect(page).to have_content('Added to your favorite list!')

      click_on 'Favorites'

      expect(page).to have_xpath("//img[contains(@src,'#{gif_1.image_path}')]")
    end
  end
