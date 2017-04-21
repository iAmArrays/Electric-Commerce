load 'ar.rb'

customers_with_orders = Customer.includes(:orders).where(orders: { status: 'new' })

def currency amount
  sprintf("$%.2f",amount)
end

total = 0

customers_with_orders.each do |customer|
  customer.orders.where(status: 'new').each do |order|
    subtotal = 0
    puts
    puts "Invoice for #{customer[:first_name]} #{customer[:last_name]}"
    puts "#{customer[:address]}"
    puts "#{customer[:city]}, #{customer.province[:name]}"
    puts
    order.line_items.each do |line_item|
      product_quantity = line_item[:quantity]
      product_price = line_item[:price]
      total = product_price * product_quantity
      puts "#{line_item.product[:name]} ................. #{product_quantity} x #{currency(product_price)} = #{currency(total)}"
      subtotal += total
    end
    pst = order[:pst_rate]
    gst = order[:gst_rate]
    hst = order[:hst_rate]
    pst_amount = subtotal * pst
    gst_amount = subtotal * gst
    hst_amount = subtotal * hst
    grand_total = subtotal + gst_amount + pst_amount + hst_amount
    puts
    puts "Sub Total      : #{currency(subtotal)}"
    case 
    when pst_amount > 0 && gst_amount > 0
      puts "PST (#{(pst* 100).round}%)  : #{currency(pst_amount)}"
      puts "GST (#{(gst * 100).round}%)  : #{currency(gst_amount)}"
    when gst_amount > 0
      puts "GST (#{(gst * 100).round}%)  : #{currency(gst_amount)}"
    when hst_amount > 0
      puts "HST (#{(hst * 100).round}%)  : #{currency(hst_amount)}"
    else
      # Super exciting stuff and things happen here!
    end
    puts "Grand Total  : #{currency(grand_total)}"
  end
end