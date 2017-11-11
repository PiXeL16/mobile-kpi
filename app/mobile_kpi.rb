require "dotenv"
Dotenv.load
require "colored"

# Database
require_relative "database/database"

# Data Sources
require_relative "datasource/ios_rating_datasource"
require_relative "datasource/android_rating_datasource"

# Entity
require_relative "entity/app_rating"

# Jobs
require_relative "job/job"
require_relative "job/rating_job"

# Managers
require_relative "manager/manager"
require_relative "manager/ios_rating_manager"
require_relative "manager/android_rating_manager"