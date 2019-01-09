namespace :db do
  desc "Run migrations"
  task :migrate, [:version] do |t, args|
    require "sequel/core"
    Sequel.extension :migration

    version = args[:version].to_i if args[:version]
    database_url = ENV.fetch 'DATABASE_URL'
    Sequel.connect database_url do |db|
      Sequel::Migrator.run db, "db/migrations", target: version
    end
  end
end
