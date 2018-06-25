class ChangeHolderLength < ActiveRecord::Migration[5.1]
  def change
    change_column :categories, :place_holder, :string, limit: 14
  end
end
