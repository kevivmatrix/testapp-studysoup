FactoryGirl.define do
  factory :product do
    sequence(:name) {|n| "name #{n}"}
    sequence(:description) {|n| "description #{n}"}
    filter Product.filter_enum.sample
  end
end
