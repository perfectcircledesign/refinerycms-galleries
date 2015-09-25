
FactoryGirl.define do
  factory :gallery, :class => Refinery::Galleries::Gallery do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

