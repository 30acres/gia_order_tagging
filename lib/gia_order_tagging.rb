module GiaOrderTagging
require "gia_order_tagging/version"
require "order/gia_order"
require "tag/gia_order_tag"


  def self.update_all_orders(tag,opts)
    # tag = 'Some Tag'
    # opts = { title: 'One',sku: 'Sku', variant_name: '' }
    shop = Shop.find_by(shopify_domain: 'i-am-gia.myshopify.com')
    session = ShopifyAPI::Session.new(shop.shopify_domain, shop.shopify_token)
    ShopifyAPI::Base.activate_session(session)

    GiaOrder.process_all_orders(tag,opts)
  end

  def self.update_recent_orders(tag,opts)
    # opts = { title: 'One',sku: 'Sku', }
    GiaOrder.process_recent_orders(tag,opts)
  end

end

