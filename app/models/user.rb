class User < ApplicationRecord
     has_many :patients
     has_many :medications, :through => :patients
     validates :username, uniqueness: true, presence: true
     validates :password, presence: {on: :create}
     has_secure_password
     
end
