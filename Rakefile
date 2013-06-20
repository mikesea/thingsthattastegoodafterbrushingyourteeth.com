
root = File.expand_path(File.dirname(__FILE__))

task :setup do |cmd, args|
  ENV["RACK_ENV"] = args[:env] || "development"
  require './app'
end

namespace :db do

  desc "Run database migrations"
  task :migrate, [:env] => :setup do |cmd, args|
    require 'sequel/extensions/migration'
    Sequel::Migrator.apply(DB, "db/migrate")
  end

  desc "Seed the database"
  task :seed, [:env] => :setup do |cmd, args|
    require "#{root}/db/seeds/things"
  end

end
