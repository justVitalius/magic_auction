FactoryGirl.define do
  factory :user do
    email 'user@mail.ru'
    password '12345678'
    password_confirmation '12345678'
    admin false
  end

  factory :admin, class: User do
    email 'admin@mail.ru'
    password '12345678'
    password_confirmation '12345678'
    admin true
  end
end