require 'rails_helper'


RSpec.feature "ProductDetails", type: :feature do
  
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end
  scenario "Click on product link with products on main page to access the product page" do
    #     # ACT
    visit root_path
    
    #     # commented out b/c it's for debugging only
    
    #     expect(page).to have_css 'article.product', count: 10
    first('article.product').click_link('product_name')
    # expect(@product.errors.full_messages).to include("Category can't be blank")
    puts page.html
    save_and_open_screenshot

  end



end
