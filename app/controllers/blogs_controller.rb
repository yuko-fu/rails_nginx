class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update]

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def edit 
    @blog = Blog.find(params[:id])
  end

  def create
    @blog = Blog.create(blog_params)
    if @blog.save
      redirect_to blogs_path, notice: "ブログを作成しました！"
    else
      render :new
    end
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "ブログを編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice:"ブログを削除しました！"
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :content)
  end
end
