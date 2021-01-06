class Illness < ApplicationRecord
    belongs_to :medication
    belongs_to :patient
    belongs_to :category
    validates :illness, presence: true
    accepts_nested_attributes_for :medication, reject_if: :all_blank
end