require "sequel"
require "mysql2"

# Main database representation
module MobileKPI
  # Database Class
  class Database
    def database
      @_db ||= Sequel.connect(ENV["DATABASE_URL"])

      unless @_db.table_exists?("ratings")
        @_db.create_table :ratings do
          primary_key :id
          String      :platform
          String      :app_version
          DateTime    :date
          Float       :average_rating
          Integer     :rating_count
        end
      end

      @_db
    end

    def store_rating(platform: nil, app_version: nil, average_rating: nil, rating_count: nil)
      database[:ratings].insert(
          platform: platform,
          app_version: app_version,
          date: Time.now,
          average_rating: average_rating,
          rating_count: rating_count
      )
    end

  end
end
