class CreateMedications < ActiveRecord::Migration[6.0]
  def change
    create_table :medications do |t|
      t.string :name
      t.string :quantity
      t.string :frequency
      t.integer :patient_id
      

      t.timestamps
    end
  end
end
