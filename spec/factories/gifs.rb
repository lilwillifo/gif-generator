FactoryBot.define do
  factory :gif do
    sequence(:image_path) { |n| "images.google.com/#{n}" }
  end
end
