require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

  # SETUP
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

  scenario "They see the selected product detail page" do
    # ACT
    visit root_path
  
    all('article.product img').first.click

    #DEBUG
    sleep 5
    save_screenshot
    
    # VERIFY
    expect(page).to have_css 'section.products-show', count: 1
   
  end
end