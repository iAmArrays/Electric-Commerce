#test = [1,2,3,4,5,6,7,8,9]
#
#puts test.sample(2)

load 'ar.rb'

#products = Product.all
#
#products.each do |product|
#  puts product[:id]
#end

#puts "Test #{Product.count}"

customer = Customer.first
order = Order.first

puts customer.inspect
puts order.inspect

lineItem = LineItem.first
product = Product.first
#
puts lineItem.inspect
puts product.inspect

#customers_with_orders = Customer.includes(:orders).where(orders: { status: 'new' })
#
#customers_with_orders.each do |customer|
#  puts customer.inspect
#end

#province = Province.all
#
#province.each do |province|
#  puts province[:name]
#end
