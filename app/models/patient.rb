class Patient < ApplicationRecord
     belongs_to :user
     has_many :illnesses, dependent: :destroy
     has_many :medications, dependent: :destroy, :through => :illnesses
     accepts_nested_attributes_for :illnesses 
     validates :name, presence: true
     
     scope :patient_meds, -> {joins(:illnesses).left_outer_joins(:medications).group(:id)}
    #  scope :user_scope, -> (id){where("user_id = ?", id)}

    #  scope :sort_name, ->  {joins(:illnesses).group(:id).order('(illnesses.illness)asc')}
     
    def self.most_illnesses
      joins(:illnesses).group(:id).order('count(patients.id)desc')
    end

      def self.search(params)
       where("LOWER(name) LIKE ?", "%#{params}%")
     
     end

end
