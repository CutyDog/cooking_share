class Api::PostsController < ApplicationController
  
  skip_before_action :verify_authenticity_token

  # GET /tasks
  def index
    # 後々のため、更新順で返します
    @posts = Post.order('updated_at DESC')
  end

  # POST /tasks
  def create
    @post = Post.new(post_params)
    #@post.user = current_user
    
    if @post.save
      render :show, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end  
  end


  # PATCH/PUT /tasks/1
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      render :show, status: :ok
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

private
 def post_params
    params.require(:post).permit(:title, :text, :img, :user_id)
    params.fetch(:post, {}).permit(:title, :text, :img, :user_id)    
 end
end