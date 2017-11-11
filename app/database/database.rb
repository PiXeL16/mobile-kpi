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
          String      :app_name
          String      :app_version
          DateTime    :date
          Float       :average_rating
          Integer     :rating_count
        end
      end

      @_db
    end

    def store_rating(app_rating)
      database[:ratings].insert(
          platform: app_rating.platform,
          app_name: app_rating.name,
          app_version: app_rating.version,
          date: Time.now,
          average_rating: app_rating.rating,
          rating_count: app_rating.rating_count
      )
    end

  end
end
