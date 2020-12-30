class TagsController < ApplicationController
  before_action :tag_article, only: [:show, :destroy]
  def index
    @tags = Tag.all
  end

  def show
  end

  def destroy
    @tag.destroy
    redirect_to tags_path
  end

  private
  def tag_article
    @tag = Tag.find(params[:id])
  end
end