class ApplicationController < ActionController::Base
  rescue_from Conekta::ApiError, :with => :error_response

  def error_response(e)
    render json: {
      errors: JSON.parse(e.response_body)["details"][0]["debug_message"]
    }, status: e.code
  end
end
