class ChangeProductCodeLength < ActiveRecord::Migration[5.1]
  def change
      change_column :products, :code, :string, null: false, limit:100, index: {unique: true}
  end
end
