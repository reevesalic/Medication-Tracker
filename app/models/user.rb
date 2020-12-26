class User < ApplicationRecord
     has_many :patients
     has_many :medications, :through => :patients
     
     validates :password, presence: {on: :create}, length: { in: 4..10 }
     validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
     has_secure_password

     
     
end
