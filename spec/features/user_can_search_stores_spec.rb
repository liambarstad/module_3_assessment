require 'rails_helper'

RSpec.feature "user can search stores" do
  scenario "from main page" do
    visit "/"
    fill_in "search", with: "80202"
    click_on "search"

    expect(current_path).to eq("/search")
    expect(page).to have_selector(".store", count: 10)
    expect(page).to have_selector(".store_name", count: 10)
    expect(page).to have_selector(".store_city", count: 10)
    expect(page).to have_selector(".store_distance", count: 10)
    expect(page).to have_selector(".store_phone", count: 10)
    expect(page).to have_selector(".store_type", count: 10)
    expect(page).to have_content("17 Total Stores")
  end
end
