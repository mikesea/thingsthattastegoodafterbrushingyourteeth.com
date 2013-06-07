
root = File.expand_path(File.dirname(__FILE__))

task :setup do
  require './app'
end

task :environment, [:env] => 'setup' do |cmd, args|
  ENV["RACK_ENV"] = args[:env] || "development"
end

namespace :db do

  desc "Run database migrations"
  task :migrate, :env do |cmd, args|
    env = args[:env] || "development"
    Rake::Task['environment'].invoke(env)

    require 'sequel/extensions/migration'
    Sequel::Migrator.apply(DB, "db/migrate")
  end

end