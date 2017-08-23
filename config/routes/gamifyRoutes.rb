ActionDispatch::Routing::Mapper.send :include, JsonApiRoutes

require 'sidekiq/web'

Rails.application.routes.draw do

  namespace :api do
    api_version(module: "V1", header: {name: "Accept", value: "application/vnd.api+json; version=1"}) do
      json_api_resources :gamified_workflows, only: [:index, :show, :update]
    end
  end

end