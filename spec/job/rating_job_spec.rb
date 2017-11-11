
describe MobileKPI::Job::RatingJob do

  it "triggers" do
    ios_rating_manager = double(:ios_rating_manager, work: "")
    android_rating_manager = double(:android_rating_manager, work: "")
    job = MobileKPI::Job::RatingJob.new(ios_rating_manager, android_rating_manager)
    job.trigger

    expect(ios_rating_manager).to have_received(:work).once
    expect(android_rating_manager).to have_received(:work).once
  end

end
