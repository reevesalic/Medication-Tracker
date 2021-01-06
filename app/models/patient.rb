class Patient < ApplicationRecord
     belongs_to :user
     has_many :illnesses, dependent: :destroy
     has_many :medications, dependent: :destroy, :through => :illnesses
     accepts_nested_attributes_for :illnesses 
     validates :name, presence: true

     scope :patient_meds, -> {joins(:illnesses).left_outer_joins(:medications).group(:id).order('count(patients.id)asc')}
     
     scope :search, -> (name) {where("name LIKE ?", "%#{name}%")}

    def self.most_illnesses
      joins(:illnesses).group(:id).order('count(patients.id)desc')
    end
end
