FactoryBot.define do
  factory :image do
    url { "https://s3.us-east-2.amazonaws.com/nicks-image-storage-public/assets/20170210_161916.jpg" }

    # This setup assumes that the tests create a list of two paragraphs and a list of two images.
    # This factory creates images with an order_index starting at 2, and assumes that there are 2 paragraphs with order_index of 0 and 1.
    sequence(:order_index) { |n| n + 2 }

    # An image belongs to a project
    project
  end
end
