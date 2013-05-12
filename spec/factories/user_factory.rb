
FactoryGirl.define do
  factory :user do
    name 'Joe'
    hashed_password 'pass'
    salt 'salt'
  end
end

