class CreateIllnesses < ActiveRecord::Migration[6.0]
  def change
    create_table :illnesses do |t|
      t.string :name
      t.integer :medication_id
      t.integer :patient_id

      t.timestamps
    end
  end
end
