class AddCategoryIdToIllnesses < ActiveRecord::Migration[6.0]
  def change
    add_column :illnesses, :category_id, :integer
  end
end
