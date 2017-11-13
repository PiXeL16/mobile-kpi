describe MobileKPI::DataSource::Fabric do

  before(:each) do
    @app_id = "com.test.io"

    allow(Fabricio::Client).to receive(:new).and_return(nil)

    @fabric_datasource ||= MobileKPI::DataSource::Fabric.new

    FabricAppInfo ||= Struct.new(:platform, :name, :bundle_id)
    @app_stub = FabricAppInfo.new("android", "test", @app_id)

    allow_any_instance_of(MobileKPI::DataSource::Fabric).to receive(:app_from_package).and_return(@app_stub)
    allow_any_instance_of(MobileKPI::DataSource::Fabric).to receive(:crash_count).and_return(500)
    allow_any_instance_of(MobileKPI::DataSource::Fabric).to receive(:total_sessions).and_return(1000)
    allow_any_instance_of(MobileKPI::DataSource::Fabric).to receive(:oom_free_percentage).and_return(0.50)
  end

  it ".crashes" do
    crashes = @fabric_datasource.crashes(@app_id)
    expect(crashes.platform).to eq("android")
    expect(crashes.name).to eq("test")
    expect(crashes.bundle_identifier).to eq(@app_id)
    expect(crashes.crashes_count).to eq(500)
    expect(crashes.from).to_not be_nil
    expect(crashes.to).to_not be_nil
  end

  it ".oom_free_sessions" do
    oom_free = @fabric_datasource.oom_free_sessions(@app_id)
    expect(oom_free.platform).to eq("android")
    expect(oom_free.name).to eq("test")
    expect(oom_free.bundle_identifier).to eq(@app_id)
    expect(oom_free.oom_free_sessions).to eq(50.0)
    expect(oom_free.from).to_not be_nil
    expect(oom_free.to).to_not be_nil
  end

  it ".crash_free_percentage" do
    crash_free = @fabric_datasource.crash_free_percentage(@app_id, Time.now, Time.now)
    expect(crash_free).to eq(50)
  end

end
