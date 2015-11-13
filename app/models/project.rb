class Project < ActiveRecord::Base
  has_many :plot_points
  has_many :writings
end

