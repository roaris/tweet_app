class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @id = params[:id]
    @post = Post.find_by(id: @id)
  end
end
