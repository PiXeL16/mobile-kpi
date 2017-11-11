describe MobileKPI::DataSource::IOSRating do

  before(:each) do
    @app_package = "com.test"
    @rating ||= MobileKPI::DataSource::AndroidRating.new(@app_package)

    AndroidRating = Struct.new(:title, :current_version, :rating, :votes) do
      def update
        nil
      end
    end
    android_rating = AndroidRating.new("Test", "434", 5, 5)

    allow(MarketBot::Play::App).to receive(:new).and_return(android_rating)
  end

  it ".rating" do
    rating = @rating.rating
    expect(rating.platform).to eq("Android")
    expect(rating.name).to eq("Test")
    expect(rating.version).to eq("434")
    expect(rating.rating).to eq(5)
    expect(rating.rating_count).to eq(5)
  end

end
