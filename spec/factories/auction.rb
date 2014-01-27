FactoryGirl.define do
  factory :auction do
    title 'auction'
    expire_date DateTime.now + 1.month
    product

    factory :auction_with_images do
      title 'auction'
      expire_date DateTime.now + 1.month
      product

      ignore do
        images_count 5
      end

      after(:create) do |a, ev|
        create_list(:product_image, ev.images_count, product: a.product)
      end
    end
  end
end