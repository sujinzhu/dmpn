class Product < ApplicationRecord
  belongs_to :category

  def self.create_many(category, product_names, batch, code_length)
    Array.new(product_names.length){|i| self.create(category: category, code: get_id(category, code_length), name: product_names[i], batch: batch)}
    # product_names.each {|name| self.create(category: category, code: get_id(category, code_length), name: name, batch: batch)}
  end

  private
  def self.get_id(category, code_length)
    _code = category.next_id(code_length)
    return _code unless exists?(code: _code)

    get_id(category, code_length)
  end
end
