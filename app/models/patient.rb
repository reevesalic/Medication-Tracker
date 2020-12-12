class Patient < ApplicationRecord
     belongs_to :user
     has_many :illnesses, dependent: :destroy
     has_many :medications, dependent: :destroy, :through => :illnesses
     accepts_nested_attributes_for :illnesses 
     validates :name, presence: true
     
     scope :most_illnesses, ->  {joins(:illnesses).group(:id).order('count(patients.id)desc')}
      
     def self.search(params)
       where("LOWER(name) LIKE ?", "%#{params}%")
     
     end

end
