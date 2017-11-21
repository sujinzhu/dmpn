class AddParentToCategory < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :parent_id, :integer, polymorphic: Category, default: nil
  end
end
