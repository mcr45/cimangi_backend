class PostsController < ApplicationController
    before_action :authenticate_request,except:[:index,:best_post]
    def create
        
        user=@current_user
        post=Post.new(post_params)
        post.user=user
        if post.save
            render json: post, status: :created
        else
            render json: post.errors,status: :unprocessable_entity 
        end
    end
    def show
        post=Post.find(params[:id])
        
        render json: PostBlueprint.render(post,view: :normal)
    end
    


    def index
        posts=Post.all
        
        posts=posts.take(7)
      
        render json: PostBlueprint.render(posts,view: :normal)
    end
   
    def update
        post=Post.find(params[:id])
        if post.user_id==@current_user
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
    def best_post
        p=Post.order(likes: :desc)
        post=p[0]
        render json: PostBlueprint.render(post,view: :normal)
    end

    private
    def post_params
        
        params.permit(:title,:body,:likes)
    end
end
