class Illness < ApplicationRecord
    belongs_to :medication
    belongs_to :patient

    validates :illness, presence: true
    # accepts_nested_attributes_for :medication, reject_if: :all_blank
    #
    def self.medication_attributes(params)
        self.medication = Medication.find_or_create_by(params)
        self.medications << medication
    #     #as smart as youd like it
    #     #change her join table to illness
    end
end