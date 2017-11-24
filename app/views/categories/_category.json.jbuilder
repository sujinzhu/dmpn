json.extract! category, :id, :name, :place_holder, :is_view, :created_at, :updated_at, :next_number
# json.parents_place_holder category.parents_place_holder
json.prefix category.prefix
json.url category_url(category, format: :json)
