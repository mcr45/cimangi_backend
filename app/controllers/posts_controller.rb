class PostsController < ApplicationController
    before_action :authenticate_request
    def create
        post=Post.new(post_params)
        if post.save
            render json: post, status: :created
        else
            render json: post.errors,status: :unprocessable_entity 
        end
    end
    def show
        post=Post.find(params[:id])
        render json: post
    end
    


    def index
        posts=Post.all
        render json: posts
    end




    private
    def post_params
        params.permit(:title,:body,:likes,:user_id)
    end
end
