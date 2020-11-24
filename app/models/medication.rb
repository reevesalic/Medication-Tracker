class Medication < ApplicationRecord
     has_many :illnesses
     has_many :patients, :through => :illnesses
     # validates :medication, presence: true
     
end
