class Patient < ApplicationRecord
     belongs_to :user
     has_many :illnesses, dependent: :destroy
     has_many :medications, dependent: :destroy, :through => :illnesses
     accepts_nested_attributes_for :illnesses 
     
     scope :med_quant, lambda {order(medications: :asc).first}
     # scope :my_search(name), lambda { where('LOWER(name) LIKE ?', params[:name]) }
     
     
     # def self.search(params)
     #      where("LOWER(name) LIKE ?", "%#{params}%")
     
     # end
end
