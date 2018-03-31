require 'rails_helper'

describe 'An admin' do
  context 'when I visit the homepage' do
    context 'enter a one-word search term in field and click generate gif' do
      it 'I create a new gif' do
        admin = create(:admin)
       allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

        visit gifs_path
        within('nav') do
          fill_in 'Category', with: 'cat'
          click_on 'Generate Gif'
        end

        expect(page).to have_content('cat')
      end
    end
  end

 describe 'As a user' do
   context 'when I visit a page' do
     it 'I do not have a form to generate gifs' do
       user = create(:user)
       # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

       visit gifs_path

       within('nav') do
         expect(page).to_not have_button('Generate Gif')
         expect(page).to_not have_field('Category')
       end
     end
   end
 end
end
