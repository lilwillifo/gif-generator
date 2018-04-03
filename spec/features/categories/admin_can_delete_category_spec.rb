require 'rails_helper'

describe 'An admin' do
  context 'when I visit the gifs index' do
    context 'and click on delete category' do
      it 'the category and all its gifs are removed' do
        admin = create(:admin)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

        visit gifs_path
        fill_in 'Category', with: 'cat'
        click_on 'Generate Gif'
        fill_in 'Category', with: 'dog'
        click_on 'Generate Gif'

        within '.cat' do
          click_on 'Delete Category'
        end

        expect(page).to_not have_content('cat')
      end
    end
  end
end
