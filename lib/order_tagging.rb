require "order_tagging/version"

module OrderTagging
  require "order/order"
  require "tag/tag"

  def self.update_all_orders
    OrderTagging::Tag.process_all_tags
  end

  def self.update_recent_orders
    OrderTagging::Tag.process_recent_tags
  end

end

