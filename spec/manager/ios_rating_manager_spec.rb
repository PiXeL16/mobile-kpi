describe MobileKPI::Manager::IOSRatingManager do

  it "builds" do
    ios_manager = MobileKPI::Manager::IOSRatingManager.build

    expect(ios_manager.database).to_not be_nil
    expect(ios_manager.data_source).to_not be_nil
  end

  it ".work" do
    mock_rating = {
        platform: "iOS",
        app_version: "5.5.5",
        average_rating: 4,
        rating_count: 5
    }
    data_source = double(:data_source, rating: mock_rating)
    database = double(:database, store_rating: "")
    ios_manager = MobileKPI::Manager::IOSRatingManager.new(data_source, database)
    ios_manager.work

    expect(data_source).to have_received(:rating).once
    expect(database).to have_received(:store_rating).once
  end

end
