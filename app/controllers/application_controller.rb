class ApplicationController < ActionController::API
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

  def find_related_object data
    data[:type].singularize.titlecase.constantize.find data[:id]
  end
end
