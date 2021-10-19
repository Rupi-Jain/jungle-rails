require 'rails_helper'

RSpec.describe Product, type: :model do
  
  describe 'Validations' do
    
    describe 'validation for names' do

      xit "product has everything" do
        @category = Category.new(name: "name")
        @product = Product.new(
          name: 'name',
          price_cents: 2000,
          quantity: 2,
          category: @category
        ) 
        expect(@product).to be_valid
      end
   

      xit "has no name" do
        @category = Category.new(name: "name")
        @product = Product.new(
          name: '',
          price_cents: 2000,
          quantity: 2,
          category: @category
        ) 
        expect(@product).to_not be_valid
        expect(@product.errors[:name].size).to eq(1)
      end
    end    

    xit "has no price" do
      @category = Category.new(name: "name")
      @product = Product.new(
        name: 'name',
        price_cents: nil ,
        quantity: 2,
        category: @category
      ) 
      expect(@product).to_not be_valid
      expect(@product.errors[:price_cents].size).to eq(1)
    end

    xit "has no quantity" do
      @category = Category.new(name: "name")
      @product = Product.new(
        name: 'name',
        price_cents: 2000 ,
        quantity: nil,
        category: @category
      ) 
      expect(@product).to_not be_valid
      expect(@product.errors[:quantity].size).to eq(1)
    end

    xit "has no category" do
      @product = Product.new(
        name: 'name',
        price_cents: 2000 ,
        quantity: 2,
      ) 
      expect(@product).to_not be_valid
      expect(@product.errors[:category].size).to eq(1)
    end

  end
end
