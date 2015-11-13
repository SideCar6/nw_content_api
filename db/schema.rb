#!/usr/bin/env ruby

ActiveRecord::Schema.define do
  create_table :projects, force: true do |t|
    t.string :name
    t.integer :user_id

    t.timestamps null: false
  end

  create_table :plot_points, force: true do |t|
    t.integer :project_id
    t.integer :plot_point_id
    t.string :summary
    t.text :description

    t.timestamps null: false
  end

  create_table :writings, force: true do |t|
    t.integer :project_id
    t.string :summary
    t.text :content

    t.timestamps null: false
  end
end

project = Project.create({
  user_id: 1,
  name: 'The Dorkness of the Soul',
})

PlotPoint.create({
  project: project,
  summary: 'Arnold wakes up',
  description: 'Arnold wakes up for the first time and realizes he has no hair.'
})

Writing.create({
  project: project,
  summary: 'Chapter One',
  content: "Although he hadn't slept that well, his head still itched like mad."
})

