class PostsController < ApplicationController
  before_action :authenticate_user, {only: [:index, :show, :new, :edit, :update, :create, :destory]}
  
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @id = params[:id]
    @post = Post.find_by(id: @id)
    @user = @post.user
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    
    if @post.save
      flash[:notice] = '投稿を編集しました'
      redirect_to('/posts/index')
    else
      render('posts/edit')
    end
  end

  def create
    @post = Post.new(content: params[:content], user_id: @current_user.id)
    @post.save

    if @post.save
      flash[:notice] = '投稿を作成しました'
      redirect_to('/posts/index')
    else
      render('posts/new')
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = '投稿を削除しました'
    redirect_to('/posts/index')
  end
end
