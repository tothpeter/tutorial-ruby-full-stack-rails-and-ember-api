class ApplicationController < ActionController::API
  before_action :authorize_request

  def relationships_params
    return @associations if @associations

    @associations = {}

    params["data"]["relationships"].each do |key, value|
      if value["data"].is_a? Array
        @associations[key.to_sym] = value["data"].map { |data| find_related_object data }
      else
        @associations[key.to_sym] = find_related_object value[:data]
      end
    end

    @associations
  end

  private

  def authorize_request
    /^Bearer (?<bearer>.*)$/ =~ request.headers['Authorization']

    if AuthToken.where(token: bearer).count == 0
      return render json: { errors: [{ title: "You need to log in for the action" }] }, status: :unauthorized
    end
  end

  def find_related_object data
    data[:type].singularize.titlecase.constantize.find data[:id]
  end
end
