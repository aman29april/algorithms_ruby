def power(x, n)
  return 1 if n == 0


  value = power(x, n/2)
  if n % 2 == 0
    return value * value
  else
    return x * value * value
  end

end

puts power(101, 17)
