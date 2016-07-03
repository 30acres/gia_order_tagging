require "order_tagging/version"

module OrderTagging
  require "order/order"
  require "tag/tag"

  def self.update_all_orders
    Tag.process_all_tags
  end

  def self.update_recent_orders
    Tag.process_recent_tags
  end

end

