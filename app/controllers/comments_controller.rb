class CommentsController < ApplicationController
    before_action :define_resource

    def show
        comments=@resource.comments
        #debugger
        render json: comments, status: :ok
    end

    def create
        #this is for testing purpose, in production I will get user id from the controller after authentication
        #u=User.create(first_name:'jeff',username:'boboboobo',last_name:"Bezos",email:'amazon@amazon.com',password:'password',password_confirmation:'password')
        
        u=User.find(9)
        @comment=@resource.comments.new(body:comment_params[:body])
        @comment.user=u
       #this is just for test purpose, in production i will get user from @current_user
        if @comment.save
            #debugger
            render json: @comment, status: :ok
        else
            render json: {error:'comment invalid'}, status: :unprocessable_entity
        end
    end



 





    private
    def comment_params
        params.permit(:body)
    end
    def define_resource
        @resource=Post.find_by_id(params[:post_id]) if params[:post_id]
        
    end
    
end
