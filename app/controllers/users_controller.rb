class UsersController < ApplicationController
    def create
        user=User.new(user_params)
        if user.save
            render json: UserBlueprint.render(user,view: :normal), status: :created
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end
    def show
        
    end







    private
    def user_params
        params.permit(:username,:first_name,:last_name,:email,:password,:password_confirmation)
    end
end
