require 'rails_helper'
describe 'A logged-in user' do
  it 'link to category show page from gif index page' do
    user = create(:user)
    category_1, category_2, category_3 = create_list(:category, 3)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit gifs_path

    click_on "#{category_1.name}"

    expect(current_path).to eq(category_path(category_1))
    expect(page).to have_content(category_1.name)
    expect(page).to_not have_content(category_2.name)
    expect(page).to_not have_content(category_3.name)
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
