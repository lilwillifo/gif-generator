require 'rails_helper'

describe User, type: :model do
  before { create(:user) }

  context 'validations' do
    it {should validate_presence_of :username}
    it {should validate_uniqueness_of :username}
    it {should validate_presence_of :password}
  end
  describe "roles" do
    it "can be created as an admin" do
      user = User.create(username: "penelope",
                         password: "boom",
                         role: 1)

      expect(user.role).to eq("admin")
      expect(user.admin?).to be_truthy
    end

    it "can be created as a default user" do
      user = User.create(username: "sammy",
                         password: "pass",
                         role: 0)

      expect(user.role).to eq("default")
      expect(user.default?).to be_truthy
    end
  end

  describe 'relationships' do
    it {should have_many :favorites}
    it {should have_many :gifs}
    it {should have_many :categories}
  end

  describe 'instance methods' do
    it '.gifs_by_category' do
      user = User.create(username: "sammy",
                         password: "pass")
      gif_1, gif_2, gif_3 = create_list(:gif, 3)
      user.gifs = [gif_1, gif_2, gif_3]

      expect(user.gifs_by_category(gif_1.category)).to eq(gif_1)
    end
  end
end
