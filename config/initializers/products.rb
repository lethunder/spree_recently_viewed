# frozen_string_literal: true

Rails.configuration.to_prepare do
  module Spree::ProductDecorator
    def self.prepended(base)
      def base.find_by_array_of_ids(ids)
        where(id: ids)
      end
    end
  end

  Spree::Product.prepend Spree::ProductDecorator
end
