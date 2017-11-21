class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name, limit: 255
      t.string :place_holder, limit: 5
      t.boolean :is_view, default: true

      t.timestamps
    end
  end
end
