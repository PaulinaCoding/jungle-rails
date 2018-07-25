require 'rails_helper'

RSpec.feature "Your test scenario should visit the home page and click 'Add to Cart' buttons for one of the products", type: :feature do
 
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
  scenario "Cart in nav bar being updated from  My Cart(0) to to My Cart(1) after clicking Add button" do
    #     # ACT
    visit root_path
    
  
    first('article.product').find_link('Add').click
    sleep 5
    # puts page.html
  
    save_and_open_screenshot

  end

end
