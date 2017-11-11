require_relative "app/mobile_kpi"

# Gets information about App rating and stores them
task :ratings do
  begin
    puts "Starting ratings job".blue
    rating_job = MobileKPI::Job::RatingJob.build
    rating_job.trigger
    puts "Ratings stored succesfully".green
  rescue => ex
    puts "Ratings job failed".red
    raise.ex
  end
end
