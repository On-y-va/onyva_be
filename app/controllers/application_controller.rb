class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_record

  def render_not_found_response(exception)
    render json: ErrorSerializer.record_not_found(exception), status: 404
  end

  def render_invalid_record(exception)
    render json: { error: [
                            title: exception.message,
                            status: '400'
                            ] 
                        }, status: 400
  end
end