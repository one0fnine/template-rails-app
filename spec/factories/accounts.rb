FactoryBot.define do
  factory :account do
    sequence(:email) { |n| "email-#{n}@domain.com" }
    password { SecureRandom.alphanumeric(8) }

    before(:create) do |resource, options|
      resource.skip_confirmation!
    end
  end
end
