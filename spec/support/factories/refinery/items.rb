
FactoryGirl.define do
  factory :item, :class => Refinery::Galleries::Item do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

