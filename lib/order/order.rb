module OrderTagging
  module Order
    def self.all_orders_array(params={})
      p_arr = []
      find_params = { limit: limit }.merge(params)
      pages.times do |p|
        p_arr = p_arr.zip(ShopifyAPI::Order.find(:all, params: find_params.merge({ page: p}) )).flatten.compact
      end
      p_arr
    end

    def self.recent_products_array
      params = { updated_at_min: 15.minutes.ago }
      all_orders_array(params)
    end

    def self.pages
      count/limit + 1
    end

    def self.limit
      50
    end

    def self.count
      ShopifyAPI::Order.count
    end

    def self.process_all_orders
      puts "============"
      puts "All Orders Array / Page Count #{all_orders_array.count}"
      puts "============"
      all_orders_array.each do |shopify_order|
        
        binding.pry

        puts "============"
        puts "Orders Per Page Count #{page.count}"
        puts "============"


        OrderTag.new(shopify_order).add_order_tags
      end
    end

    def self.process_recent_orders
      recent_products_array.each do |shopify_order|
          OrderTag.new(shopify_order).add_order_tags
      end
    end



  end
end
