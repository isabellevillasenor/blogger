class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :destroy, :edit, :update]
  before_action :require_login, only: [:new, :create, :edit, :destroy]
  def index
    @articles = Article.all
  end

  def show
    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    
    redirect_to article_path(@article)
  end
  
  def destroy
    @article.destroy
    redirect_to articles_path
  end

  def edit
  end

  def update
    @article.update(article_params)
    flash.notice = "Article '#{@article.title}' Updated!"
    redirect_to article_path(@article)
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.permit(:title, :body, :tag_list, :image)
  end
end