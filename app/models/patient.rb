class Patient < ApplicationRecord
     belongs_to :user
     has_many :medications
     has_many :notes, :through => :medications
end
