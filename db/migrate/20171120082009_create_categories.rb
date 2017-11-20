class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :place_holder
      t.boolean :is_view

      t.timestamps
    end
  end
end
