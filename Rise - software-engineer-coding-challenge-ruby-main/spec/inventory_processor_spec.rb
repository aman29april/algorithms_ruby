# frozen_string_literal: true

require './inventory_processor'

RSpec.describe InventoryProcessor do
  describe '.product_most_in_stock' do
    let(:most_in_stock_id) { 18 }

    it 'gets the product with most availability in stock' do
      expect(InventoryProcessor.product_most_in_stock[:product_id]).to eq(most_in_stock_id)
    end
  end

  describe '.inventory_clusters' do
    let(:expected_clusters_product_ids) do
      [
        [4],
        [1, 2],
        [3, 5, 6],
        [7, 8, 9],
        [10, 11],
        [12, 16],
        [13, 15, 18, 20],
        [14, 17, 19]
      ]
    end

    it 'groups products by categories' do
      inventory_clusters = InventoryProcessor.inventory_clusters
      ids_in_each_cluster = inventory_clusters.map { |cluster| cluster.map { |product| product[:product_id] } }
      expect(ids_in_each_cluster).to contain_exactly(*expected_clusters_product_ids)
    end
  end

  describe '.recommend_products' do
    let(:max_calories) { 1300 }

    it 'recommends products with combined calories of less than or equal to the input' do
      recommended_products = InventoryProcessor.recommend_products(max_calories)
      combined_calories = recommended_products.map { |product| product[:serving_calories] }.reduce(:+)
      expect(combined_calories).to be <= max_calories
    end

    it 'returns recommended products in a random order' do
      recommended_products_first_run = InventoryProcessor.recommend_products(max_calories)
      recommended_products_second_run = InventoryProcessor.recommend_products(max_calories)
      expect(recommended_products_first_run).not_to eq(recommended_products_second_run)
    end
  end
end
