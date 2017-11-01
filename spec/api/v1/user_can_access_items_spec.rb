require 'rails_helper'

# When I send a GET request to `/api/v1/items`
# I receive a 200 JSON response containing all items
# And each item has an id, name, description, and image_url but not the created_at or updated_at
#
# When I send a GET request to `/api/v1/items/1`
# I receive a 200 JSON response containing the id, name, description, and image_url but not the created_at or updated_at
#
# When I send a DELETE request to `/api/v1/items/1`
# I receive a 204 JSON response if the record is successfully deleted
#
# When I send a POST request to `/api/v1/items` with a name, description, and image_url
# I receive a 201 JSON  response if the record is successfully created
# And I receive a JSON response containing the id, name, description, and image_url but not the created_at or updated_at

RSpec.feature "user can access items" do
  scenario "and get all items" do
    item1 = Item.create(name: "sample1", description: "sample1", image_url: "sample1")
    item2 = Item.create(name: "sample2", description: "sample2", image_url: "sample2")

    get('/api/v1/items')
    result = JSON.parse(response.body)

    expect(result.count).to eq(2)
    expect(result[0]["name"]).to eq("sample1")
    expect(result[0]["description"]).to eq("sample1")
    expect(result[0]["image_url"]).to eq("sample1")
    expect(result[0]["created_at"]).to eq(nil)
    expect(result[0]["updated_at"]).to eq(nil)
  end

  xscenario "and get a single item" do

  end

  scenario "and delete an item" do

  end

  scenario "and create an item" do

  end
end
