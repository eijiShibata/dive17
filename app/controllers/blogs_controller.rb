class BlogsController < ApplicationController
  before_action :set_blog, only: [:edit, :update, :destroy]

  def index
    @blog = Blog.where(status: '2')
  end

  def show
  end

  def new
    @blog = Blog.new
  end

  def create
    Blog.create(blogs_params)
    redirect_to blogs_path
  end

  def edit
  end

  def update
    @blog.update(blogs_params)
    redirect_to blogs_path
  end

  def destroy
    @blog.update(status: 3)
    redirect_to blogs_path
  end

  def draft
    @blog = Blog.where(status: '1')
  end

  def trash
    @blog = Blog.where(status: '3')
  end

  private
    def blogs_params
      params.require(:blog).permit(:title, :content, :status)
    end

    def set_blog
      @blog = Blog.find(params[:id])
    end
end
