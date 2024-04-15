class LikesController < ApplicationController
    before_action :authenticate_request
    def like
        @post = Post.find(params[:id])
        liked = @current_user.likes.find_by(post: @post)
        #debugger
        if liked.nil?  
            @post.likes += 1
            @post.save!
            @current_user.likes.create(post: @post)
            render json: PostBlueprint.render(@post,view: :normal)
        else
            render json: {'error':"post already liked"}, status: 403
        end




    end
end
