FactoryBot.define do
  factory :comment do
    
  end

  factory :user do
    sequence (:email) {|n|
      "dummyEmail#{n}@gmail.com"
    }
    password { "secretPassword" }
    password_confirmation { "secretPassword" }
  end

  factory :gram do
    message { "hello" }
    image { fixture_file_upload(Rails.root.join('spec', 'fixtures', 'sample_img.png').to_s, 'image/png') }
    association :user
  end
end