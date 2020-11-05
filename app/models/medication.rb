class Medication < ApplicationRecord
     has_many :illnesses
     has_many :patients :through => :illnesses
end
