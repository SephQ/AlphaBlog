class ArticlesController < ApplicationController
  # def articles
  # end
  def show
    # binding.break
    # byebug    # gem 'debug' isn't working, so trying to go back to 'byebug'
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    # render plain: params[:article]
    @article = Article.new( params.require(:article).permit(:title, :description) )
    if @article.save
      flash[:notice] = "Article was created successfully."  # Message box flash-hash updated for success message. 
      redirect_to @article  # Syntactic sugar for redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update( params.require(:article).permit(:title, :description) )
      flash[:notice] = "Article was updated succesffully"
      redirect_to @article
    else
      render 'edit'
    end
  end
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path, status: :see_other
  end
end