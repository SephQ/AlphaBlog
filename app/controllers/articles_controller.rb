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
end