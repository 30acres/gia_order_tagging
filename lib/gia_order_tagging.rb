module GiaOrderTagging
require "gia_order_tagging/version"
require "order/gia_order"
require "tag/gia_order_tag"


  def self.update_all_orders(tag,opts)
    pre_orders = [
      { sku: 'TM3749RED', title: 'Delevingne Hoodie'},
      { sku: 'GIA3754SIL', title: 'Sienna Skirt'},
      { sku: 'GIA3775SIL', title: 'Sienna Top'},
      { sku: 'GIA3775BLK', title: 'Twiggy Top'},
      { sku: 'GIA3541BLK', title: 'Tyler Denim Jacket'},
      { sku: 'GIA3836NUD', title: 'Kentley Bodysuit'}
    ]

    # tag = 'Some Tag'
    # opts = { title: 'One',sku: 'Sku', variant_name: '' }
    shop = Shop.find_by(shopify_domain: 'i-am-gia.myshopify.com')
    session = ShopifyAPI::Session.new(shop.shopify_domain, shop.shopify_token)
    ShopifyAPI::Base.activate_session(session)
    pre_orders.each do |po|
      GiaOrder.process_all_orders("#{po[:title]} (Pre Order #{Time.zone.now.strftime('%m/%y')})", po)
    end
  end

  def self.update_recent_orders(tag,opts)
    # opts = { title: 'One',sku: 'Sku', }
    GiaOrder.process_recent_orders(tag,opts)
  end

end

