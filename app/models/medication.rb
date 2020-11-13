class Medication < ApplicationRecord
     has_many :illnesses
     has_many :patients, :through => :illnesses
     accepts_nested_attributes_for :illnesses
     
end
