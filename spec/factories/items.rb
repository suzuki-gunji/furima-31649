FactoryBot.define do
  factory :item do
    name                   {Faker::Base.regexify("[あ]{2}")}
    explain                {Faker::Base.regexify("[あ]{2}")}
    category_id            {Faker::Number.between(from:2, to:11)}
    status_id              {Faker::Number.between(from:2, to:3)}
    delivery_fee_id        {Faker::Number.between(from:2, to:3)}
    prefecture_id          {Faker::Number.between(from:2, to:3)}
    days_id                {Faker::Number.between(from:2, to:3)}
    price                  {Faker::Number.between(from:300, to:3000)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
