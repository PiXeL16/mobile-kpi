describe MobileKPI::Manager::AndroidRatingManager do

  it "builds" do
    ios_manager = MobileKPI::Manager::AndroidRatingManager.build

    expect(ios_manager.database).to_not be_nil
    expect(ios_manager.data_source).to_not be_nil
  end

  it ".work" do
    data_source = double(:data_source, rating: nil)
    database = double(:database, store_rating: nil)
    ios_manager = MobileKPI::Manager::AndroidRatingManager.new(data_source, database)
    ios_manager.work

    expect(data_source).to have_received(:rating).once
    expect(database).to have_received(:store_rating).once
  end

end
