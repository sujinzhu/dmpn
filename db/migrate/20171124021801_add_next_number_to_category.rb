class AddNextNumberToCategory < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :next_number, :integer, default: 1
  end
end
