require 'rails_helper'

describe 'An admin' do
  context 'when I visit the homepage' do
    context 'enter a one-word search term in field and click generate gif' do
      it 'I create a new gif' do
        admin = create(:admin)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

        visit gifs_path
        fill_in 'Category', with: 'cat'
        click_on 'Generate Gif'

        expect(page).to have_content('cat')
      end
    end
    context 'when I visit category show page' do
      it 'I can add more to that specific category' do
        admin = create(:admin)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

        category_1 = create(:category)
        category_1.gifs = create_list(:gif, 3)

        visit category_path(category_1)

        expect(page).to have_content('Add another!')
      end
    end
  end

 describe 'As a user' do
   context 'when I visit the homepage' do
     it 'I cannot generate gifs' do
       user = create(:user)
       allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

       visit gifs_path

       expect(page).to_not have_button('Generate Gif')
       expect(page).to_not have_field('Category')
     end
   end
 end
end
