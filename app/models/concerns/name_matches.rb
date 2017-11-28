module NameMatches
  extend ActiveSupport::Concern

  module ClassMethods
    def name_matches(search)
      arel_table[:name].matches(search)
    end
  end
end
