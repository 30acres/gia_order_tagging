module OrderTagging
  module Order
    def self.all_orders_array(params={})
      p_arr = []
      find_params = { limit: limit }.merge(params)
      pages.times do |p|
        p_arr << ShopifyAPI::Order.find(:all, params: find_params.merge({ page: p}) ) 
      end
      p_arr
    end

    def self.recent_orders_array
      params = { updated_at_min: 15.minutes.ago }
      all_orders_array(params)
    end

    def self.pages
      count/limit
    end

    def self.limit
      250
    end

    def self.count
      ShopifyAPI::Order.count
    end

  def self.process_all_orders
    all_products_array.each do |page|
      page.each do |order|
        OrderTag.new(order).add_order_tags
      end
    end
  end

  def self.process_recent_orders
    recent_order_array.each do |page|
      page.each do |order|
        OrderTag.new(order).add_order_tags
      end
    end
  end



  end
end
