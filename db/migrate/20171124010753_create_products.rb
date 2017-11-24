class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.references :category, foreign_key: true
      t.string :code, null: false, limit:20, index: {unique: true}
      t.string :name, null: false
      t.string :batch

      t.timestamps
    end
  end
end
