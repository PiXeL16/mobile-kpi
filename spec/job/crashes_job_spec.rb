describe MobileKPI::Job::CrashesJob do

  it "triggers" do
    crashes_manager = double(:crashes_manager, work: "")
    job = MobileKPI::Job::CrashesJob.new(crashes_manager)
    job.trigger

    expect(crashes_manager).to have_received(:work).once
  end

end
