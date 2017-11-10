describe MobileKPI::DataSource::IOSRating do

  before(:each) do
    @buddy_build_response = [
        {"_id"=>"59fde74bdf87510001", "app_id"=>"12341234", "repo_url"=>"https://github.com/asdf/ios.git", "build_status"=>"success", "finished"=>true, "commit_info"=>{"tags"=>[], "commit_sha"=>"234", "branch"=>"master", "author"=>"Lalo Landas", "message"=>"This is a test", "html_url"=>""}, "build_number"=>2434, "created_at"=>"2017-11-04T16:14:03.411Z", "started_at"=>"2017-11-04T16:14:04.935Z", "finished_at"=>"2017-11-04T16:18:49.505Z", "test_summary"=>{"tests_count"=>1316, "tests_passed"=>1316, "code_coverage_percentage"=>0}, "links"=>{"download"=>[], "install"=>[]}, "scheme_name"=>"Unit Tests"}
    ]
    stub_request(:get, 'https://api.buddybuild.com/v1/apps/12341234/builds?branch=master&limit=20').
        to_return(:status => 200, :body => @buddy_build_response.to_json, :headers => {})
  end

  describe 'returns rating information correctly in a hash' do
    before do
      pubticker = {
          "bid" => "4137.75",
          "ask" => "4137.76",
          "volume" => {
              "BTC" => "8816.825818942",
              "USD" => "36034502.396535113171",
              "timestamp" => 1_503_269_400_000
          },
          "last" => "4137.76"
      }

      allow(exchange).to receive(:request).with(url: "/v1/pubticker/btcusd", http_method: :get).and_return(pubticker)
      allow(exchange).to receive(:request).with(url: "/v1/pubticker/ethusd", http_method: :get).and_return(pubticker)
    end
  end
end
