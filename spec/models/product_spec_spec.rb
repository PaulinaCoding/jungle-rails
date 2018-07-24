require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do


    it "is valid with all valid attributes" do
      @category = Category.create name: "Outdoor"

      @product = Product.create name: "Rainbow hammock", price_cents: 199.00, quantity: 13, category_id: @category.id
      expect(@product).to be_valid
    end

    it "is not valid without a name" do
      @category = Category.create name: "Outdoor"
      @product = Product.create  price_cents: 199.00, quantity: 13, category_id: @category.id
      expect(@product.errors.full_messages).to include("Name can't be blank")
    
    end

    it "is not valid without a price" do
      @category = Category.create name: "Outdoor"
      @product = Product.create  name: "Rainbow hammock", quantity: 13, category_id: @category.id
      expect(@product.errors.full_messages).to include("Price cents can't be blank")
    end


    it "is not valid without a quantity" do
      @category = Category.create name: "Outdoor"
      @product = Product.create  name: "Rainbow hammock", price_cents: 199.00, category_id: @category.id
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end


    it "is not valid without a category" do
      @category = Category.create name: "Outdoor"
      @product = Product.create name: "Rainbow hammock", price_cents: 199.00, quantity: 13
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end

end

