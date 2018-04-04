require 'rails_helper'
  describe 'A logged-in user' do
    it 'can see one gif per category' do
      user = create(:user)
      category = create(:category)
      gif_1 = create(:gif, category: category)
      gif_2 = create(:gif, category: category)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit gifs_path

      expect(page).to have_xpath("//img[contains(@src,'#{gif_1.image_path}')]")
      expect(page).to_not have_xpath("//img[contains(@src,'#{gif_2.image_path}')]")
    end
    it 'and mark their favorites to see in their favorites list' do
      user = create(:user)
      category = create(:category)
      gif_1 = create(:gif, category: category)
      gif_2 = create(:gif, category: category)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit category_path(category)

      within "#img-#{gif_1.id}" do
        click_link 'Add to Favorites'
      end

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content('Added to your favorite list!')
      expect(page).to have_css("#img-#{gif_1.id}")
    end
    it 'and can unfavorite a gif' do
      user = create(:user)
      category = create(:category)
      gif_1 = create(:gif, category: category)
      gif_2 = create(:gif, category: category)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit category_path(category)

      within "#img-#{gif_1.id}" do
        click_link 'Add to Favorites'
      end

      expect(user.favorites.count).to eq(1)

      within "#img-#{gif_1.id}" do
        click_link 'Remove from Favorites'
      end

      expect(page).to have_content('Removed from your favorite list!')
      expect(user.favorites.count).to eq(0)
    end
  end
