class Patient < ApplicationRecord
     belongs_to :user
     has_many :notes, :through => medications
end
