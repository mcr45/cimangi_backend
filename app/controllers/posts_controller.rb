class PostsController < ApplicationController
    #before_action :authenticate_request,except:[:index]
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
        #render json: post
        render json: PostBlueprint.render(post,view: :normal)
    end
    


    def index
        posts=Post.all
        render json: posts
        #render json: PostBlueprint.render(posts,view: :normal)
    end
    def update
        post=Post.find(params[:id])
        if post.user_id=@current_user
            post.update!(post_params)
        else
            render json: {error:'not the post author'}, status: :unauthorized
        end
        
    end

    def destroy
        post=Post.find(params[:id])
        if post.user_id=@current_user
            post.destroy
        else
            render json: {error:'not the post author'}, status: :unauthorized
        end
    end


    private
    def post_params
        params.permit(:title,:body,:likes,:user_id)
    end
end
