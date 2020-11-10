class User < ApplicationRecord
     has_many :patients
     has_many :medications, :through => :patients
    
     validates :username, uniqueness: true, presence: true

     has_secure_password
    #  def self.from_omniauth(auth)
    #       where(email: auth.info.email).first_or_initialize do |user|
    #         user.user_name = auth.info.name
    #         user.email = auth.info.email
    #         user.password = SecureRandom.hex
    #       end
    #     end
end
