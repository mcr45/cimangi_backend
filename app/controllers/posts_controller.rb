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
        post.increment!(:views)
        render json: PostBlueprint.render(post,view: :normal)
    end
    def index
        posts=Post.order(created_at: :desc).page(params[:page]).per(12)
        render json: {posts:PostBlueprint.render_as_json(posts,view: :normal),total_pages:posts.total_pages,current_page:posts.current_page}
    end
   
    def update
        post=Post.find(params[:id])
        if post.user_id==@current_user.id
            post.update!(post_params)
            posts=Post.all 
            posts=posts.take(7)
            render json: PostBlueprint.render(posts,view: :normal)
        else
            render json: {error:'not the post author'}, status: :unauthorized
        end
        
    end

    def destroy
        post=Post.find(params[:id])
        if post.user_id==@current_user.id
            post.destroy
            posts=Post.all 
            posts=posts.take(7)
            render json: PostBlueprint.render(posts,view: :normal)
        else
            render json: {error:'not the post author'}, status: :unauthorized
        end
    end
    def best_post
        p=Post.order(likes: :desc)
        post=p[0]
        render json: PostBlueprint.render(post,view: :normal)
    end
    def my_most_viewed
        posts=Post.where(user_id:@current_user.id).order(views: :desc)
        post=posts[0]
        render json: PostBlueprint.render(post,view: :normal)
    end

    private
    def post_params
        
        params.permit(:title,:body,:likes)
    end
end
