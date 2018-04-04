require 'rails_helper'
describe 'A logged-in user' do
  it 'can see all categories on gif index page' do
    user = create(:user)
    gifs = create_list(:gif, 3)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit gifs_path

    gifs.each do |gif|
      expect(page).to have_content(gif.category.name)
    end
  end
  it 'can see all their categories on favorite page' do
    user = create(:user)
    user.gifs = create_list(:gif, 3)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user)

    user.gifs.each do |gif|
      expect(page).to have_content(gif.category.name)
    end
  end
end
