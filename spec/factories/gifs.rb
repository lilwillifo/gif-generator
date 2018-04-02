FactoryBot.define do
  factory :gif do
    category
    sequence(:image_path) { |n| "http://image.giphy.com/#{n}" }
  end
end
