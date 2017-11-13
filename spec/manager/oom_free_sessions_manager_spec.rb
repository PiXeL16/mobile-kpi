describe MobileKPI::Manager::OOMFreeSessionsManager do

  it ".work" do
    datasource = double(:datasource, oom_free_sessions: nil)
    database = double(:database, store_oom_free_sessions: nil)
    manager = MobileKPI::Manager::OOMFreeSessionsManager.new(datasource, database, "ios.test.com")
    manager.work

    expect(datasource).to have_received(:oom_free_sessions).once
    expect(database).to have_received(:store_oom_free_sessions).once
  end

end
