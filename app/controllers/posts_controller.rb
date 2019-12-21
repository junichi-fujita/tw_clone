class PostsController < ApplicationController
  before_action :set_post, only: [:edet, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, notice: "投稿できました！"
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path, notice: "編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "削除しました！"
  end
  private

  def post_params
    params.require(:post).permit(:content)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
