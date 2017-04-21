load 'ar.rb'

customers = Customer.all

customers.each do |customer|
  customer_first_name = customer[:first_name]
  first_name = customer_first_name.split(" ").first
  last_name = customer_first_name.split(" ").last
  customer[:first_name] = first_name
  customer[:last_name] = last_name
  customer.save
end
