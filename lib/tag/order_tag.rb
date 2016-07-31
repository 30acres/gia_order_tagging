class OrderTag
  def initialize(order)
    @order = order
    @customer = order.customer
    @initial_order_tags = order.tags
  end

  def add_order_tags
    binding.pry
    
    # @product.tags = removed_initial_tags
    # if has_size_option?
    #   if has_variants?
    #     variants.each do |variant|
    #       @product.tags = [@product.tags,order_tag(variant)].join(',')
    #     end
    #   end
    # end
    # puts "PRODUCT ID (before): #{@product.id}"
    # puts "#{initial_tags} ====> #{cleaned_tags}"
    # if tags_changed?
    #   # puts "#{@product.title} : Updated Tags!"
    #   @product.tags = cleaned_tags
    #   @product.save!
    #   puts "PRODUCT ID (after): #{@product.id}"
    #   sleep(1.second) ## For the API
    # else
    #   # puts "#{@product.title} : No Change in Tags!"
    # end
  end

  def cleaned_tags
    @order.tags.split(',').reject{ |c| c.empty? or c == "  " }.uniq.join(',')
  end

  def initial_tags
    @initial_order_tags
  end

  def tags_changed?
    clean_tags(initial_tags) != clean_tags(cleaned_tags)
  end

  def clean_tags(tags)
    tags.split(',').map{ |t| t.strip }.uniq.sort
  end


end
