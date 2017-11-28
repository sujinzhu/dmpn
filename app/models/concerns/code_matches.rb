module CodeMatches
  extend ActiveSupport::Concern

  module ClassMethods
    def code_matches(search)
      arel_table[:code].matches(search)
    end
  end
end
