module GiaOrderTagging
  class GiaOrderTag
    def initialize(order, tag, opts={})
      @order = ShopifyAPI::Order.find(order)
      @tag = tag
      @opts = opts
      @initial_order_tags = @order.tags
    end

    def is_fulfilled?
      @order.fulfillment_status.to_s.downcase == 'fulfilled'
    end

    def has_unshipped_pre_order?
      @order.line_items.any? { |li| (@opts[:title] ? li.title.include?(@opts[:title]) : true) and (@opts[:variant_name] ? li.name.include?(@opts[:variant_name]) : true) and (@opts[:sku] ? li.sku.to_s.include?(@opts[:sku]) : true) and li.fulfillment_status.to_s.downcase != 'fulfilled' }
    end

    def add_order_tags
      unless is_fulfilled?
        if has_unshipped_pre_order?
          @order.tags = @order.tags + ", #{@tag}"
          binding.pry
          # @order.save!
          sleep(1)
          puts 'MATCHED'
        end
      end
    end

  end
end
