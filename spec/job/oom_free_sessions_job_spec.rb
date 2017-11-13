describe MobileKPI::Job::OOMFreeSessionsJob do

  it "triggers" do
    oom_free_manager = double(:oom_free_manager, work: "")
    job = MobileKPI::Job::OOMFreeSessionsJob.new(oom_free_manager)
    job.trigger

    expect(oom_free_manager).to have_received(:work).once
  end

end
