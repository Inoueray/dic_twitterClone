class BlogsController < ApplicationController
  before_action :set_blog, only: [:edit, :update, :destroy]
  before_action :logged_in_check, only: [:new, :edit, :show]

  def index
    @blogs = Blog.all
  end

  def new
    if params[:back]
      @blog = Blog.new(blog_params)
    else
    	@blog = Blog.new
    end
  end

  def create
    @blog = Blog.create(blog_params)
    if @blog.save
      redirect_to blogs_path, notice: "投稿完了！"
    else
      render 'new'
    end
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "投稿を編集したよ！"
    else
      render 'edit'
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice: "投稿を削除したよ！"
  end

  def confirm
    @blog = Blog.new(blog_params)
  end

private
  def blog_params
    params.require(:blog).permit(:content)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def logged_in_check
    unless logged_in? then
      redirect_to new_session_path
    end
  end
end
