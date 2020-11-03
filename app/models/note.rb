class Note < ApplicationRecord
     belongs_to :medication
     belongs_to :patient, :through => medications
end
