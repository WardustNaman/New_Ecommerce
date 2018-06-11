class Review < ApplicationRecord
validates_presence_of :body, :product_id, :rating, :user_id
validates_length_of :body, within: 10...1000
belongs_to :product
belongs_to :user
end
