class CommentsController < ApplicationController
    before_action :authenticate_request
    before_action :define_resource

    def show
        comments=@resource.comments
        
        render json: comments, status: :ok
    end

    def create
        
        u=@current_user
        @comment=@resource.comments.new(body:comment_params[:body])
        @comment.user=u
       
        if @comment.save   
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
        @resource=Recipe.find_by_id(params[:recipe_id]) if params[:recipe_id]
    end
    
end
