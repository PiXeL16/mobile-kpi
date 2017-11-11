describe MobileKPI::DataSource::IOSRating do

  before(:each) do
    json_response ||= File.read("#{RSPEC_ROOT}/fixtures/ios_rating_response.json")
    @app_id ||= "111222"
    @rating ||= MobileKPI::DataSource::IOSRating.new(@app_id)

    stub_request(:get, @rating.rating_endpoint)
        .to_return(status: 200, body: json_response, headers: {})
  end

  it ".rating_endpoint" do
    expect(@rating.rating_endpoint).to include(@app_id)
  end

  it ".rating" do
    rating = @rating.rating
    expect(rating.platform).to eq("iOS")
    expect(rating.name).to_not be_nil
    expect(rating.version).to_not be_nil
    expect(rating.rating).to_not be_nil
    expect(rating.rating_count).to_not be_nil
  end

end
