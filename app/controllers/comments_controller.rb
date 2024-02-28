class CommentsController < ApplicationController
    before_action :define_resource

    def index
        comments=@resource.comments.all
        render comments
    end

    def create
        comment=Comment.new(comment_params)
        if comment.save
            render comment, status: :success
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
