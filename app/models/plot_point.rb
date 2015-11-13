class PlotPoint < ActiveRecord::Base
  belongs_to :project
  belongs_to :plot_point
end

