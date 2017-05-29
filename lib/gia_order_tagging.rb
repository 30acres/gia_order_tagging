module GiaOrderTagging
require "gia_order_tagging/version"
require "order/gia_order"
require "tag/gia_order_tag"


  def self.update_all_orders
    GiaOrder.process_all_orders
  end

  def self.update_recent_orders
    GiaOrder.process_recent_orders
  end

end

