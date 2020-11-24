class User < ApplicationRecord
     has_many :patients
     has_many :medications, :through => :patients
     validates :name, presence: true
     validates :password, presence: {on: :create}
     has_secure_password
     validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
