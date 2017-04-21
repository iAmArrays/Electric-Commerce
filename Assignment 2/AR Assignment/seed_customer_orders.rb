load 'ar.rb'

customer1 = Customer.where(:province_id=> 1).first
customer2 = Customer.where(:province_id=> 2).first
customer3 = Customer.where(:province_id=> 3).first
customers = [customer1, customer2, customer3]

product_array = Product.all

customers.each do |customer|
  order = customer.orders.build
  products = product_array.sample(4)
  province = customer.province
  products.each do |product|
    line_item = order.line_items.build
    line_item.product = product
    line_item.quantity = rand(1..100)
    line_item.product_id = product.id
    line_item.order_id = order.id
    line_item.price = product.price
  end
  order.status = 'new'
  order.pst_rate = province.pst
  order.gst_rate = province.gst
  order.hst_rate = province.hst
  order.customer_id = customer.id
  order.save
end

customer2_array = [customer2]

customer2_array.each do |customer|
  order = customer.orders.build
  products = product_array.sample(4)
  province = customer.province
  products.each do |product|
    line_item = order.line_items.build
    line_item.product = product
    line_item.quantity = rand(1..100)
    line_item.product_id = product.id
    line_item.order_id = order.id
    line_item.price = product.price
  end
  order.status = 'new'
  order.pst_rate = province.pst
  order.gst_rate = province.gst
  order.hst_rate = province.hst
  order.customer_id = customer.id
  order.save
end

customers.each do |customer|
  puts customer.inspect
end