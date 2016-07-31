require "order_tagging/version"

module OrderTagging
  require "order/order"
  require "tag/order_tag"

  def self.update_all_orders
    OrderTagging::Order.process_all_orders
  end

  def self.update_recent_orders
    OrderTagging::Order.process_recent_orders
  end

end

