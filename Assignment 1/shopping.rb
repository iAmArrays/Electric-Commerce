orders_by_customer_id = {
  101 => [
  { :product_id => 13, :quantity => 2  },
  { :product_id => 35, :quantity => 16 },
  { :product_id => 11, :quantity => 3  }],
  24 => [
  { :product_id => 11, :quantity => 3  },
  { :product_id => 35, :quantity => 4  }],
  36 => [
  { :product_id => 25, :quantity => 17 },
  { :product_id => 42, :quantity => 2  },
  { :product_id => 35, :quantity => 7  }]
}
products_by_id = {
  11 => { :name => "teddy bear", :price => 14.23 },
  25 => { :name => "toy ghosts", :price => 4.34  },
  13 => { :name => "giant newt", :price => 56.00 },
  42 => { :name => "sandcastle", :price => 12.45 },
  35 => { :name => "shoe phone", :price => 86.00 }
}
customers_by_id = {
  101 => { :name => 'John Smith', :address => '128 Good St.', :city => 'Winnipeg', :province => 'MB' },
  24  => { :name => 'Ralph Woodhorse', :address => '67 Pylon Way', :city => 'Calgary', :province => 'AB' },
  36  => { :name => 'Mary Contra', :address => '342 Modem Drive', :city => 'Regina', :province => 'SK' }
}
SALES_TAX_BY_PROVINCE = { 'MB' => 0.07, 'AB' => 0, 'BC' => 0.07, 'SK' => 0.05}
GST = 0.05
def currency amount
  sprintf("$%.2f",amount)
end

total = 0

customers_by_id.each do |id, customer|
  puts
  puts "Invoice for #{customer[:name]}"
  puts "#{customer[:address]}"
  puts "#{customer[:city]}, #{customer[:province]}"
  puts
  subtotal = 0
  orders_by_customer_id[id].each do |product|
    product_number =  product[:product_id]
    product_quantity =  product[:quantity]
    product_name = products_by_id[product_number][:name]
    product_price = products_by_id[product_number][:price]
    total = product_quantity * product_price
    
    puts "#{product_name} ................. #{product_quantity} x #{currency(product_price)} = #{currency(total)}"
    subtotal += total
  end
    gst_amount = subtotal * GST
    pst_percent = SALES_TAX_BY_PROVINCE[customer[:province]]
    pst_amount = subtotal * pst_percent
    grand_total = subtotal + gst_amount + pst_amount
    puts
    puts "Sub Total      : #{currency(subtotal)}"
    puts "PST (#{pst_percent * 100}%)  : #{currency(pst_amount)}"
    puts "GST (#{GST * 100}%)  : #{currency(gst_amount)}"
    puts "Grand Total  : #{currency(grand_total)}"
end

########
# Part 2 #
########

