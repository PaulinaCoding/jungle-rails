require 'rails_helper'

RSpec.describe Product, type: :model do

  subject {
    described_class.new(name: "Unicorn candelabra", price: 34.99,
                      quantity: 50, category: "furniture")
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    @product = Product.new(name: nil)
    expect(product).to_not be_valid
  end

  it "is not valid without a price" do
    @product = Product.new(price: nil)
    expect(product).to_not be_valid
  end


  it "is not valid without a quantity" do
    @product = Product.new(quantity: nil)
    expect(product).to_not be_valid
  end


  it "is not valid without a category" do
    @product = Product.new(category: nil)
    expect(product).to_not be_valid
  end


end



# RSpec.describe Auction, :type => :model do
#   it "is valid with valid attributes" do
#     expect(Auction.new).to be_valid
#   end

#   it "is not valid without a title"
#   it "is not valid without a description"
#   it "is not valid without a start_date"
#   it "is not valid without a end_date"
# end