namespace :db do
  task :environment do
    require './boot.rb'
  end

  task :migrate => :environment do
    require './db/schema.rb'
  end
end

