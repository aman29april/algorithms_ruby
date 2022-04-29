# frozen_string_literal: true

module InventoryData
  INVENTORY = [
    {
      product_id: 1, # unique product identifier
      name: 'Mars Bar', # the name of the product
      producer: 'Mars Co', # the producer of the product
      categories: ['chocolate', 'energy bar'], # array of categories the product belongs to
      instock_count: 12, # the amount of the product available in stock
      serving_calories: 300 # the amount of calories the product has per serving
    },
    {
      product_id: 2,
      name: 'Chewy',
      producer: 'Quaker',
      categories: ['chocolate', 'energy bar'],
      instock_count: 112,
      serving_calories: 280
    },
    {
      product_id: 3,
      name: 'Organic Dark Maple',
      producer: '365 industries',
      categories: ['pantry essentials'],
      instock_count: 50,
      serving_calories: 200
    },
    {
      product_id: 4,
      name: 'Sushi box',
      producer: 'Genji Sushi',
      categories: ['prepared food'],
      instock_count: 110,
      serving_calories: 400
    },
    {
      product_id: 5,
      name: 'Destination Series Olive Oil',
      producer: 'California Olive Ranch',
      categories: ['pantry essentials'],
      instock_count: 15,
      serving_calories: 50
    },
    {
      product_id: 6,
      name: 'Dill Pickles',
      producer: 'Bubbies',
      categories: ['pantry essentials'],
      instock_count: 45,
      serving_calories: 170
    },
    {
      product_id: 7,
      name: 'Beef Ribeye Steak',
      producer: 'Whole Foods Market',
      categories: %w[meat steak],
      instock_count: 15,
      serving_calories: 500
    },
    {
      product_id: 8,
      name: 'Boneless Beef Steak',
      producer: 'Whole Foods Market',
      categories: %w[meat steak],
      instock_count: 25,
      serving_calories: 500
    },
    {
      product_id: 9,
      name: 'Beef Tenderloin Steak',
      producer: 'Whole Foods Market',
      categories: %w[meat steak],
      instock_count: 5,
      serving_calories: 400
    },
    {
      product_id: 10,
      name: 'Boneless Chicken Breast',
      producer: '',
      categories: %w[meat chicken],
      instock_count: 500,
      serving_calories: 350
    },
    {
      product_id: 11,
      name: 'Chicken Thighs',
      producer: '',
      categories: %w[meat chicken],
      instock_count: 400,
      serving_calories: 380
    },
    {
      product_id: 12,
      name: 'Almond Butter',
      producer: 'Kraft',
      categories: ['pantry essentials', 'spreads'],
      instock_count: 56,
      serving_calories: 400
    },
    {
      product_id: 13,
      name: 'Kidney beans',
      producer: '365 Wholefoods',
      categories: ['pantry essentials', 'beans'],
      instock_count: 33,
      serving_calories: 400
    },
    {
      product_id: 14,
      name: 'Salsa',
      producer: 'Heinz',
      categories: ['pantry essentials', 'sauces'],
      instock_count: 1,
      serving_calories: 300
    },
    {
      product_id: 15,
      name: 'Chickpeas',
      producer: '365 Wholefoods',
      categories: ['pantry essentials', 'beans'],
      instock_count: 400,
      serving_calories: 340
    },
    {
      product_id: 16,
      name: 'Creamy Peanut Butter',
      producer: 'Kraft',
      categories: ['pantry essentials', 'spreads'],
      instock_count: 56,
      serving_calories: 500
    },
    {
      product_id: 17,
      name: 'Ketchup',
      producer: 'Heinz',
      categories: ['pantry essentials', 'sauces'],
      instock_count: 554,
      serving_calories: 350
    },
    {
      product_id: 18,
      name: 'Black beans',
      producer: '365 Wholefoods',
      categories: ['pantry essentials', 'beans'],
      instock_count: 999,
      serving_calories: 320
    },
    {
      product_id: 19,
      name: 'Kitchen Mayo',
      producer: 'Heinz',
      categories: ['pantry essentials', 'sauces'],
      instock_count: 4,
      serving_calories: 200
    },
    {
      product_id: 20,
      name: 'Garbanzo Beans',
      producer: '365 Wholefoods',
      categories: ['pantry essentials', 'beans'],
      instock_count: 657,
      serving_calories: 300
    }
  ].freeze

  def self.products
    INVENTORY
  end
end
