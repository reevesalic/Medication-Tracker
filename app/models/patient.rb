class Patient < ApplicationRecord
     belongs_to :user
     has_many :illnesses, dependent: :destroy
     has_many :medications, dependent: :destroy, :through => :illnesses
     accepts_nested_attributes_for :illnesses 
       
     def self.medication_attributes(params)
      binding.pry
     end
      # self.medication = Medication.find_or_create_by(params)
      # self.medications << medication
  # #     #as smart as youd like it
  # #     #change her join table to illness
  # end
   
     scope :med_quant, lambda {order(medications: :asc).first}
     
     def self.search(params)
       where("LOWER(name) LIKE ?", "%#{params}%")
     
     end

end
