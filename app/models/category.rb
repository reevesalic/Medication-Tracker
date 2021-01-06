class Category < ApplicationRecord
     has_many :illnesses
     # scope :category_illness, -> {where('illness= ?')}
end
