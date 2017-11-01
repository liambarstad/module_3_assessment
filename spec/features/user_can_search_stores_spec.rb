require 'rails_helper'

RSpec.feature "user can search stores" do
  scenario "from main page" do
    visit "/"
    fill_in "search", with: "80202"
    click_on "search"

    expect(current_path).to eq("/search")
    expect(page).to have_selector(".store", count: 10)
    expect(page).to have_content("17 Total Stores")
    # And I should see the long name, city, distance, phone number and store type for each of the 10 results
  end
end
