module InsensitiveOrder
  extend ActiveSupport::Concern

  class_methods do
    def insensitive_order(attribute)
      order("TRIM(LOWER(UNACCENT(#{attribute})))")
    end
  end
end
