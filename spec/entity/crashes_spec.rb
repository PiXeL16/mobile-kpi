describe MobileKPI::Entity::Crashes do

  before(:each) do
    @crashes = MobileKPI::Entity::Crashes.new(platform: "Android",
                                            name: "Test",
                                            bundle_identifier: "com.test.test",
                                            crashes_count: 500,
                                            from: Time.now,
                                            to: Time.now)
  end

  it ".to_hash" do
    expect(@crashes.to_hash[:platform]).to eq("Android")
    expect(@crashes.to_hash[:name]).to eq("Test")
    expect(@crashes.to_hash[:bundle_identifier]).to eq("com.test.test")
    expect(@crashes.to_hash[:crashes_count]).to eq(500)
    expect(@crashes.to_hash[:from]).to_not be_nil
    expect(@crashes.to_hash[:to]).to_not be_nil
  end
end

