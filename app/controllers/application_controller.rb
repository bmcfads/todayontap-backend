class ApplicationController < ActionController::API
  include JsonWebToken

  before_action :authorize_request

  def authorize_request
    #   header_authorization = request.headers['Authorization']
    #   token = header_authorization.split(' ').last if header_authorization
    #   begin
    #     decode_jwt(token)
    #   rescue StandardError
    #     render json: { error: 'unauthorized' }, status: :unauthorized
    #   end
  end
end
