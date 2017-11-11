describe MobileKPI::Entity::AppRating do

  before(:each) do
    @rating = MobileKPI::Entity::AppRating.new(platform: "Android",
                                               name: "Test",
                                               version: "5.5.5",
                                               rating: 5,
                                               rating_count: 550)
  end

  it ".to_hash" do
    expect(@rating.to_hash[:platform]).to eq("Android")
    expect(@rating.to_hash[:name]).to eq("Test")
    expect(@rating.to_hash[:version]).to eq("5.5.5")
    expect(@rating.to_hash[:rating]).to eq(5)
    expect(@rating.to_hash[:rating_count]).to eq(550)
  end
end

