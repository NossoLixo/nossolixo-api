module InsensitiveOrder
  extend ActiveSupport::Concern

  class_methods do
    def build_criteria(attribute)
      "TRIM(LOWER(UNACCENT(#{attribute})))"
    end

    def insensitive_order(attribute)
      order(build_criteria(attribute))
    end
  end
end
