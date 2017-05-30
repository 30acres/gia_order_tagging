module GiaOrderTagging
require "gia_order_tagging/version"
require "order/gia_order"
require "tag/gia_order_tag"


  def self.update_all_orders(tag,opts)
    # tag = 'Some Tag'
    # opts = { title: 'One',sku: 'Sku', }
    GiaOrder.process_all_orders(tag,opts)
  end

  def self.update_recent_orders(tag,opts)
    # opts = { title: 'One',sku: 'Sku', }
    GiaOrder.process_recent_orders(tag,opts)
  end

end

