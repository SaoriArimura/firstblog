FactoryGirl.define do
  factory :post do
    review "text"
    user_id "1"
    category_tag_id "1"
    item_id "1"

    factory :invalid_post do
      item_id nil
    end
  end
end
