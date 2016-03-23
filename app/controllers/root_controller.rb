class RootController < ApplicationController
  def index
    render json: {
      # Insert URLs to resources
      #  clients: clients_url
    }
  end
end
