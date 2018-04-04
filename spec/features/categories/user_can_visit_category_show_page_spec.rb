require 'rails_helper'
describe 'A logged-in user' do
  it 'link to category show page from gif index page' do
    user = create(:user)
    gifs = create_list(:gif, 3)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit gifs_path

    click_on "#{gifs.first.category.name}"

    expect(current_path).to eq(category_path(gifs.first.category))
    expect(page).to have_content(gifs.first.category.name)
  end
  it 'can see all gifs within a category' do
    user = create(:user)
    category = create(:category)
    category.gifs = create_list(:gif, 4)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit category_path(category)

    category.gifs.each do |gif|
      expect(page).to have_css("#img-#{gif.id}")
    end
  end
end
