class Product < ApplicationRecord
  include NameMatches
  include CodeMatches

  belongs_to :category

  def self.create_many(category, product_names, batch, code_length)
    Array.new(product_names.length){|i| self.create(category: category, code: get_id(category, code_length), name: product_names[i], batch: batch)}
    # product_names.each {|name| self.create(category: category, code: get_id(category, code_length), name: name, batch: batch)}
  end

  def self.full_search_query(search='')
    query = joins(:category)
    unless search.blank?
      _search = "%#{search}%"
      query = query.where(
        name_matches(_search).or(
          code_matches(_search)).or(
          batch_matches(_search)).or(
        Category.name_matches(_search))
      )
      end
      query
    end

    def self.batch_matches(search)
      arel_table[:batch].matches(search)
    end

    private
    def self.get_id(category, code_length)
      _code = category.next_id(code_length)
      return _code unless exists?(code: _code)

      get_id(category, code_length)
    end
  end
