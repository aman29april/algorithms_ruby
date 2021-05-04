# first repeating element

def first_repeating_element(ar)
  ar_hash = {}
  ar.each do |e|
    ar_hash[e] = ar_hash[e].to_i + 1
  end
  h = ar_hash.find { |_key, value| value > 1 }
  h[0]
end

ar = [10, 5, 3, 4, 3, 5, 6]
# puts first_repeating_element(ar)

puts first_repeating_element([6, 10, 5, 4, 9, 120, 4, 6, 10])
