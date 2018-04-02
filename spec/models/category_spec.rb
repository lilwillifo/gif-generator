require 'rails_helper'

describe Category, type: :model do
  before { create(:category) }

  context 'validations' do
    it {should validate_presence_of :name}
  end
end
