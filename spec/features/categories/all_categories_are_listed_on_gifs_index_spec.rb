require 'rails_helper'
describe 'A logged-in user' do
  it 'can see all categories' do
    user = create(:user)
    category_1, category_2, category_3 = create_list(:category, 3)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit gifs_path

    expect(page).to have_content(category_1.name)
    expect(page).to have_content(category_2.name)
    expect(page).to have_content(category_3.name)
  end
end
