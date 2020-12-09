class Medication < ApplicationRecord
     has_many :illnesses
     has_many :patients, :through => :illnesses
    validates :name, :quantity, :frequency, presence: true
end
