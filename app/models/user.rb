class User < ApplicationRecord
	has_many :reviews
	has_many :permissions
  has_many :orders
	has_many :roles, through: :permissions
  has_many :cart_line_items
  has_many :wishlist_items
  has_many :addresses
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         validates_presence_of :username, :mobile
         validates_numericality_of :mobile
         validates_length_of :mobile, is:10

         after_create :assign_customer_role

         def assign_customer_role
         	Permission.create(user_id: self.id, role_id: Role.last.id)
         end
         def role?(role)
         	self.roles.pluck(:name).include?(role)
         end
end
