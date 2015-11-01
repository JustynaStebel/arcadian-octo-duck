# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    subtotal "9.99"
    total "9.99"
    status 1
  end
end
