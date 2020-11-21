class Patient < ApplicationRecord
     belongs_to :user
     has_many :illnesses
     has_many :medications, :through => :illnesses
     accepts_nested_attributes_for :illnesses 
     
     def self.search(params)
          where("LOWER(name) LIKE ?", "%#{params}%")
     # binding.pry
     end
end
