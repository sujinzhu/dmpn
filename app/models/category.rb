class Category < ApplicationRecord
  belongs_to :parent, class_name: "Category", optional: true
  has_many :children, class_name: "Category", foreign_key: "parent_id"

  scope :roots, -> { where(parent: nil)}

  def is_root?
    parent.blank?
  end

  def parents_place_holder
    return '' if is_root?
    @parent_holder = ''

    _get_parent_place_holder(parent)

    @parent_holder
  end

  def prefix
    parents_place_holder + place_holder
  end

  def to_s
    name
  end

  private
  def _get_parent_place_holder(parent)
    @parent_holder.insert(0, parent.place_holder)
    return if parent.is_root?

    _get_parent_place_holder(parent.parent)
  end
end
