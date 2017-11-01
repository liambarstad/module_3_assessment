require 'rails_helper'

RSpec.feature "user can access items" do
  scenario "and get all items" do
    item1 = Item.create(name: "sample1", description: "sample1", image_url: "sample1")
    item2 = Item.create(name: "sample2", description: "sample2", image_url: "sample2")

    get('/api/v1/items')
    result = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(result.count).to eq(2)
    expect(result[0]["name"]).to eq("sample1")
    expect(result[0]["description"]).to eq("sample1")
    expect(result[0]["image_url"]).to eq("sample1")
    expect(result[0]["created_at"]).to eq(nil)
    expect(result[0]["updated_at"]).to eq(nil)
  end

  xscenario "and get a single item" do
    item1 = Item.create(name: "sample1", description: "sample1", image_url: "sample1")
    item2 = Item.create(name: "sample2", description: "sample2", image_url: "sample2")

    get("/api/v1/items/#{item1.id}")
    result = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(result["name"]).to eq(item1.name)
    expect(result["description"]).to eq(item1.description)
    expect(result["image_url"]).to eq(item1.image_url)
  end

  xscenario "and delete an item" do
    item1 = Item.create(name: "sample1", description: "sample1", image_url: "sample1")
    item2 = Item.create(name: "sample2", description: "sample2", image_url: "sample2")

    delete("/api/v1/items/#{item1.id}")
    result = JSON.parse(response.body)

    expect(response.status).to eq(204)
    expect(Item.first).to eq(item2)
  end

  xscenario "and create an item" do
    item1 = Item.new(name: "sample1", description: "sample1", image_url: "sample1")

    post("/api/v1/items")
    result = JSON.parse(response.body)

    expect(response.status).to eq(204)
    expect(result["name"]).to eq(item1.name)
    expect(result["description"]).to eq(item1.description)
    expect(result["image_url"]).to eq(item1.image_url)
  end
end
