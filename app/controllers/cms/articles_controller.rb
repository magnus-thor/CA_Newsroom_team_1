class Cms::ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end
 
  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to cms_articles_path, notice: "Article is successfully created."
    else
      render 'new'
    end
  end
 
  private

  def article_params
    params.require(:article).permit(:title, :lede, :body, :author, :category_id)
  end

end