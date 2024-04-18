class ApplicationController < ActionController::API
    def authenticate_request
        header=request.headers['Authorization']
        header=header.split(' ').last if header
        begin
            #decoded = JWT.decode(header, Rails.application.secrets.secret_key_base).first
            decoded = JWT.decode(header, Rails.application.credentials.secret_key_base).first
            @current_user = User.find(decoded['user_id'])
          rescue JWT::ExpiredSignature
            render json: { error: 'Token has expired' }, status: :unauthorized
          rescue JWT::DecodeError
            render json: { errors: 'Unauthorized' }, status: :unauthorized
        end
    end

    def create_token(id)
      token=jwt_encode(user_id:id)
    end


    def jwt_encode(payload,exp=24.hours.from_now)
      payload[:exp]=exp.to_i
      JWT.encode(payload, Rails.application.secrets.secret_key_base)
    end

end
