require 'rails_helper'

RSpec.describe TestProduct, type: :model do
  describe 'values' do
    it { should respond_to :name }
    it { should respond_to :price }
    it { should respond_to :quantity }
  end

  describe 'sorting values' do 
    it 'name' do 
      test1 = TestProduct.create(name: 'Tissues')
      test2 = TestProduct.create(name: 'Vehicles')
      test3 = TestProduct.create(name: 'Drinks')
      tests = TestProduct.by_name
      expect(tests.first.name).to eq(test3.name)
      expect(tests[1].name).to eq(test1.name)
      expect(tests.last.name).to eq(test2.name)
    end

    it 'price ascending' do 
      test1 = TestProduct.create(price: 8)
      test2 = TestProduct.create(price: 15000)
      test3 = TestProduct.create(price: 2)
      tests = TestProduct.by_price
      expect(tests.first.price).to eq(test3.price)
      expect(tests[1].price).to eq(test1.price)
      expect(tests.last.price).to eq(test2.price)
    end

    it 'price descending' do
      test1 = TestProduct.create(price: 8)
      test2 = TestProduct.create(price: 15000)
      test3 = TestProduct.create(price: 2)
      tests = TestProduct.by_price(true)
      expect(tests.first.price).to eq(test2.price)
      expect(tests[1].price).to eq(test1.price)
      expect(tests.last.price).to eq(test3.price)
    end

    it 'quantity' do 
      test1 = TestProduct.create(quantity: 200)
      test2 = TestProduct.create(quantity: 2)
      test3 = TestProduct.create(quantity: 6)
      tests = TestProduct.by_quantity
      expect(tests.first.quantity).to eq(test2.quantity)
      expect(tests[1].quantity).to eq(test3.quantity)
      expect(tests.last.quantity).to eq(test1.quantity)
    end
  end

  describe 'methods' do 
    it 'advertisement' do
      expect(TestProduct.create.advertisement).to eq("Buy now for best savings!")
    end    

    it 'warning' do 
      expect(TestProduct.create.warning).to eq("These products are not FDA approved.")
    end
  end
end