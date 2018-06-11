class Address < ApplicationRecord
validates_presence_of :name, :details, :street, :landmark, :user_id, :pincode, :state, :city
belongs_to :user
has_many :orders
end
