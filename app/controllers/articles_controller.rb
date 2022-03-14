class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  # def articles
  # end
  def show
    # binding.break
    # byebug    # gem 'debug' isn't working, so trying to go back to 'byebug'
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    # render plain: params[:article]
    @article = Article.new( article_params )
    if @article.save
      flash[:notice] = "Article was created successfully."  # Message box flash-hash updated for success message. 
      redirect_to @article  # Syntactic sugar for redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def update
    if @article.update( article_params )
      flash[:notice] = "Article was updated successfully"
      redirect_to @article
    else
      render 'edit'
    end
  end
  def destroy
    @article.destroy
    redirect_to articles_path, status: :see_other
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end

end