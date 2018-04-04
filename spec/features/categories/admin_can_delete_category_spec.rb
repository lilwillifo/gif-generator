require 'rails_helper'

describe 'An admin' do
  context 'when I visit the gifs index' do
    context 'and click on delete category' do
      it 'the category and all its gifs are removed' do
        admin = create(:admin)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

        visit gifs_path

        fill_in 'Category', with: 'abc'
        click_on 'Generate Gif'

        within '#abc' do
          click_on 'Delete Category'
        end

        expect(page).to have_content('abc was deleted!')
      end
    end
  end
end

describe 'As a user' do
  context 'when I visit the gifs index' do
      it 'I cannot delete a category' do
        user = create(:user)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit gifs_path

        expect(page).to_not have_content('Delete Category')
      end
    end
  end
