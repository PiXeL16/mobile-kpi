require_relative "app/mobile_kpi"

# Gets information about App rating and stores them
task :ratings do
  begin
    puts "Starting ratings job".blue
    rating_job = MobileKPI::Job::RatingJob.build
    rating_job.trigger
    puts "Ratings stored successfully".green
  rescue => ex
    puts "Ratings job failed".red
    raise.ex
  end
end

# Gets information about App crashes and stores them
task :crashes do
  begin
    puts "Starting crashes job".blue
    crashes_job = MobileKPI::Job::CrashesJob.build
    crashes_job.trigger
    puts "Crashes information stored successfully".green
  rescue => ex
    puts "Crashes job failed".red
    raise.ex
  end
end
