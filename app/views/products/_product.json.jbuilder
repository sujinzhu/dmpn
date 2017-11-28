json.extract! product, :id, :category_id, :name, :code, :batch, :created_at, :updated_at
json.cataegory_name product.category.name
json.url product_url(product)
