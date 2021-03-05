FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email  {Faker::Internet.free_email}
    password  {'pass00'}
    password_confirmation {password}
    family_name {"山本"}
    first_name{"二郎"}
    family_name_kana{"ヤマモト"}
    first_name_kana{"ジロウ"}
    birth_date            {'2020-03-01'}
  end
end