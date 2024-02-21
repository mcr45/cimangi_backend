class PostsController < ApplicationController
    def create
        post=Post.new(params)
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

    end
end