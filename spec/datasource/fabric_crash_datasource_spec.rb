describe MobileKPI::DataSource::Crashes do

  before(:each) do
    @app_id = "com.test.io"

    allow(Fabricio::Client).to receive(:new).and_return(nil)

    @crashes_datasource ||= MobileKPI::DataSource::Crashes.new

    FabricAppInfo ||= Struct.new(:platform, :name, :bundle_id)
    @app_stub = FabricAppInfo.new("android", "test", @app_id)

    allow_any_instance_of(MobileKPI::DataSource::Crashes).to receive(:app_from_package).and_return(@app_stub)
    allow_any_instance_of(MobileKPI::DataSource::Crashes).to receive(:crash_count).and_return(500)
    allow_any_instance_of(MobileKPI::DataSource::Crashes).to receive(:total_sessions).and_return(1000)

  end

  it ".crashes" do
    crashes = @crashes_datasource.crashes(@app_id)
    expect(crashes.platform).to eq("android")
    expect(crashes.name).to eq("test")
    expect(crashes.bundle_identifier).to eq(@app_id)
    expect(crashes.crashes_count).to eq(500)
    expect(crashes.from).to_not be_nil
    expect(crashes.to).to_not be_nil
  end

  it ".crash_free_percentage" do
    crash_free = @crashes_datasource.crash_free_percentage(@app_id, Time.now, Time.now)
    expect(crash_free).to eq(50)
  end

end
