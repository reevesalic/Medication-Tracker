class Patient < ApplicationRecord
     belongs_to :user
     has_many :illnesses
     has_many :medications, :through => :illnesses
     accepts_nested_attributes_for :illnesses 
end
