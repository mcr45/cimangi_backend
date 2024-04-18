class UsersController < ApplicationController
    before_action :authenticate_request
def create
    user=User.new(user_params)
    if user.save
        tkn=create_token(user.id)
        
        render json: {user:UserBlueprint.render_as_json(user,view: :normal),token:tkn}, status: :created
    else
        render json: user.errors.full_messages, status: :unprocessable_entity
    end
end
    def show
       user=User.find_by(id:params[:id])
       render json: UserBlueprint.render(user,view: :normal) 
    end

    def load_user
        user=@current_user
        render json: UserBlueprint.render_as_json(user,view: :normal) 
    end






    private
    def user_params
        params.permit(:username,:first_name,:last_name,:email,:password,:password_confirmation)
    end
end
