class Patient < ApplicationRecord
     belongs_to :user
     has_many :illnesses
     has_many :medications, :through => :illnesses
     accepts_nested_attributes_for :illnesses 
     

     # scope :search(params), -> { where("LOWER(name) LIKE ?", ("params")) }
     # scope :search, ->(name_param) {where(:name == name_param)}

     def self.search(params)
          where("LOWER(name) LIKE ?", "%#{params}%")
     end
end
