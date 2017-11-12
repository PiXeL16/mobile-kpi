describe MobileKPI::Manager::CrashesManager do
  
  it ".work" do
    datasource = double(:datasource, crashes: nil)
    database = double(:database, store_crashes: nil)
    manager = MobileKPI::Manager::CrashesManager.new(datasource, database, "android.test.com", "ios.test.com")
    manager.work

    expect(datasource).to have_received(:crashes).twice
    expect(database).to have_received(:store_crashes).twice
  end

end
