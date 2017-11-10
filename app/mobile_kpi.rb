require 'dotenv'
Dotenv.load
require "colored"

# Database
require_relative "database/database"

# Data Sources
require_relative "datasource/ios_rating_datasource"

# Jobs
require_relative "job/job"
require_relative "job/rating_job"

# Managers
require_relative "manager/manager"
require_relative "manager/ios_rating_manager"
