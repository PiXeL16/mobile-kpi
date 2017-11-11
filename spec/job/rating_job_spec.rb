
describe MobileKPI::Job::RatingJob do

  it "triggers" do
    manager = double(:manager, work: "")

    job = MobileKPI::Job::RatingJob.new(manager: manager)
    job.trigger

    expect(manager).to have_received(:work).once
  end

end
