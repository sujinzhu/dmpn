class Category < ApplicationRecord
  belongs_to :parent, class_name: "Category", optional: true
  has_many :children, class_name: "Category", foreign_key: "parent_id"

  scope :roots, -> { where(parent: nil)}

  def is_root?
    parent.blank?
  end
end
