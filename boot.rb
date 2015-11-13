#!/usr/bin/env ruby

require 'bundler'
Bundler.require

ENV["RACK_ENV"] ||= 'development'

db = "db/%s.db" % [ ENV["RACK_ENV"] ]

ActiveRecord::Base.establish_connection({
  :adapter  => "sqlite3",
  :database => db,
  pool: 5,
})

[
  'app/models/project.rb',
  'app/models/plot_point.rb',
  'app/models/writing.rb',
  'app/api.rb',
].each do |f|
  require_relative f
end

