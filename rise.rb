# frozen_string_literal: true
# require 'pry'
require './inventory_data'
require 'set'

module InventoryProcessor
  extend self

  # Time Complexity: O(n) where n is size of products
  # Space Complexity: O(1)
  def product_most_in_stock
    most_stocked = InventoryData.products[0]
    InventoryData.products.each do |product|
      most_stocked = product if most_stocked[:instock_count] < product[:instock_count]
    end
    most_stocked
  end

  def inventory_clusters
    InventoryData.products.group_by{|product| product[:categories]}.values
    # result = {}
    # InventoryData.products.each do |product|
    #   key = product[:categories]
    #   result[key] = result.fetch(key, []) << element
    # end
    # result.values
  end

  # Time Complexity: O(n * t) where n is number of products and t is target calories
  # Space Complexity: O(n * t)
  def recommend_products(max_calories)
    products = InventoryData.products
    products_count = products.length

    # To save memory, factor can be used.
    # all calories values will be divided by factor as for current data set, values are multiples of 10
    # example  if target is 1500, value will become 1500 / 10 => 150
    # sly, calories of each product will also be factored.
    factor = 10

    dp = Array.new(products_count+1) { Array.new(max_calories/factor + 1, false)}
    dp.each_with_index do |row, i|
      row.each_with_index do |val, j|
        if(j.zero?) #first column
          dp[i][j] = true
        elsif(i.zero?) #first row
          dp[i][j] = false
        else
          # if jth product is not included, and with upper cell, target is possible,
          # take value from upper cell
          if(dp[i-1][j])
            dp[i][j] = true
            next
          end

          current_product = products[i-1]
          product_calories = current_product[:serving_calories] / factor

          # target value is equal or greater then current value.
          # So we can include this product
          if(j  >= product_calories)
            # if with inclusion, remaining calories can be made by previous products?
            if(dp[i-1][j - product_calories] == true)
              dp[i][j] = true
            end
          end
        end
      end
    end

    # find closest target sum
    i = products_count
    j = max_calories / factor

    while(j >0 && !dp[i][j]) #if we do not have exact match, try to reduce calories
      j-=1
    end

    # if no possible products with the target calories
    return [] if j.zero?

    queue = []
    queue << Pair.new(i , j , [])

    possible_products = []
    while queue.any?
      rem = queue.shift

      # if we reached bounds
      if(rem.i.zero? || rem.j.zero?)
        possible_products << rem.path
        next
      end

      exc = dp[rem.i - 1][rem.j] # upper cell

      # If upper cell is true, means there is possibility that current product is not included
      if exc
        queue << Pair.new(rem.i - 1, rem.j, rem.path)
      end

        # binding.pry
      current_product = products[rem.i - 1]
      remaining_calories = current_product[:serving_calories] / factor
      if(rem.j  >= remaining_calories)
        remaining_calories = rem.j  - remaining_calories

        # if current product is included and check if possibility with remaining calories
        inc = dp[rem.i - 1][remaining_calories]
        if(inc)
          # add product index in path
          rem.path.dup.push(rem.i - 1)
          # [rem.path, (rem.i - 1)].flatten
          # binding.pry
          queue << Pair.new(rem.i - 1, remaining_calories,  rem.path.dup.push(rem.i - 1))
        end
      end
    end
    return [] if possible_products.empty?
    # puts possible_products.to_s
    # puts possible_products.shuffle.first.map{|index| products[index][:serving_calories]}.inject(:+)

    puts possible_products.shuffle.first.to_a.to_s
    possible_products.shuffle.first.to_a.map{|index| products[index]}
  end
end

Pair = Struct.new(:i, :j, :path)

puts (InventoryProcessor.recommend_products(500)).to_s
