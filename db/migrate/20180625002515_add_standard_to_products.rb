class AddStandardToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :standard, :string, limit: 1, default: 'N'
  end
end
