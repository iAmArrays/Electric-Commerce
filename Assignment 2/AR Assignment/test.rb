load 'ar.rb'

customer = Customer.first
order = customer.orders.build

province = customer.province

#puts customer.inspect
#puts order.inspect
#puts province.inspect

order.status = 'new'
order.pst_rate = province.pst
order.gst_rate = province.gst
order.hst_rate = province.hst
# We should also save a backup of the pst, gst and hst rate
# from the customers province into the order. Add that to this code.
order.save

#puts order.inspect

product1 = Product.first
line_item1 = order.line_items.build

line_item1.product = product1
line_item1.quantity = 12
line_item1.price = product1.price

line_item1.save

customer_orders = customer.orders

puts customer_orders.inspect