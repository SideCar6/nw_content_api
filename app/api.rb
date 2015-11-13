class API < Sinatra::Application
  get '/' do
    redirect '/projects'
  end

  get '/plot_points' do
    plot_points = PlotPoint.all

    Jbuilder.encode do |json|
      json.array! plot_points do |plot_point|
        json.extract! plot_point, :summary, :description
        json.parent plot_point.plot_point
        json.project plot_point.project
      end
    end
  end

  get '/plot_points/:id' do
    plot_point = PlotPoint.find(params[:id])

    Jbuilder.encode do |json|
      json.extract! plot_point, :id, :summary, :description

      json.parent plot_point.plot_point
      json.project plot_point.project
    end
  end

  post '/projects' do
    request.body.rewind
    project = Project.create! JSON.parse(request.body.read)

    project.to_json
  end

  get '/projects' do
    projects = Project.all

    Jbuilder.encode do |json|
      json.array! projects
    end
  end

  get '/projects/:id' do
    project = Project.find(params[:id])

    Jbuilder.encode do |json|
      json.extract! project, :name

      json.plot_points project.plot_points
      json.writings project.writings
    end
  end
end

