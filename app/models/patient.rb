class Patient < ApplicationRecord
     belongs_to :user
     has_many :illnesses
     has_many :medications, :through => :illnesses
end
