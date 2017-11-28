json.data(@products) do |product|
  json.partial! "product", product: product
end

json.draw @draw
json.recordsTotal @recordsTotal
json.recordsFiltered @recordsFiltered
