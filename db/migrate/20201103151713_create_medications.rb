class CreateMedications < ActiveRecord::Migration[6.0]
  def change
    create_table :medications do |t|
      t.string :name
      t.string :quantity
      t.string :frequency
      t.string :illness

      t.timestamps
    end
  end
end
