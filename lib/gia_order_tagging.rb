require "gia_order_tagging/version"

module GiaOrderTagging
  require "order/order"
  require "tag/order_tag"

  def self.update_all_orders
    Order.process_all_orders
  end

  def self.update_recent_orders
    Order.process_recent_orders
  end

end

