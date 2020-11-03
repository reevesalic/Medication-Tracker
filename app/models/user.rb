class User < ApplicationRecord
     has_many :patients
     has_many :medications, :through => patients
end
