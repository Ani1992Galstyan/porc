class Post < ApplicationRecord
	has_one_attached :image
	has_many :post_categories
	has_many :categories, through: :post_categories
	has_one :post_view
end
