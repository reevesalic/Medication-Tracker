class Patient < ApplicationRecord
     belongs_to :user
     has_many :illnesses, dependent: :destroy
     has_many :medications, dependent: :destroy, :through => :illnesses
     accepts_nested_attributes_for :illnesses 
       
     def self.medication_attributes(params)
      
     end
    #  scope :patient_quant, lambda {where(patients: :asc)}
      #  scope :med_quant, lambda {joins(:medication).(patient).(illness)where("COUNT(medications) > ?", count)} 
    #  scope :med_quant, lambda {where(medications: :asc).first}
    scope :patient_quant, lambda {where("COUNT(patients) > ?", count)}
    binding.pry
     #join medications table and maybe join illnesses 
     def self.search(params)
       where("LOWER(name) LIKE ?", "%#{params}%")
     
     end

end
