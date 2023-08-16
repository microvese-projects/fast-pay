FactoryBot.define do
  factory :user do
    first_name { 'John' }
    last_name { 'Doe' }
    email { 'dummy@gmail.com' }
    password { '12345678' }
  end
end
