def mean(array)
  sum_of_array = 0.0 
  mean_of_array = 0.0
  array.each do |number|
    sum_of_array += number
    mean_of_array = sum_of_array / array.length
  end
  return mean_of_array
end

def median(array)
  sorted_array = array.sort
  length_of_array = sorted_array.length
  middle = length_of_array / 2
  if(length_of_array % 2 == 0) then
    even_median = ((sorted_array[middle - 1]) + \
                            (sorted_array[middle])) / 2.0
    return even_median
  else
    return sorted_array[middle]
  end
end

def variance(array)
  m = mean(array)
  sum = 0.0
  final_sum = 0.0
  array.each do |x|
    sum += (x - m) * (x - m)
  end
  final_sum = sum / array.length
  return final_sum
end

def standard_deviation(array)
  return Math.sqrt(variance(array))
end

the_array = []

100000.times {the_array << rand(1..1000)}

puts "The Mean: #{mean(the_array)}"
puts "Median : #{median(the_array)}"
puts "The Std Dev : #{standard_deviation(the_array)}"