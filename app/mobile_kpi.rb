require "dotenv"
Dotenv.load
require "colored"

# Database
require_relative "database/database"

# Data Sources
require_relative "datasource/ios_rating_datasource"
require_relative "datasource/android_rating_datasource"
require_relative "datasource/crashes_datasource"

# Entity
require_relative "entity/rating"
require_relative "entity/crashes"

# Jobs
require_relative "job/job"
require_relative "job/rating_job"
require_relative "job/crashes_job"

# Managers
require_relative "manager/manager"
require_relative "manager/ios_rating_manager"
require_relative "manager/android_rating_manager"
require_relative "manager/crashes_manager"