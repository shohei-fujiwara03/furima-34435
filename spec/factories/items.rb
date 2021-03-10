FactoryBot.define do
  factory :item do
    title {'hoge'}
    category_id {2}
    condition_id {2}
    price {300}
    details {Faker::Lorem.sentence}
    shipping_fee_id {2}
    prefecture_id {2}
    shipping_date_id {2}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/star.png'), filename: 'star.png')
    end
  end
end
