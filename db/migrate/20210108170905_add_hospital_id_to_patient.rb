class AddHospitalIdToPatient < ActiveRecord::Migration[6.0]
  def change
    add_column :patients, :hospital_id, :integer
  end
end
