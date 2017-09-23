class ArticlesController < ApplicationController
	include ArticlesHelper

before_action :find_article, only: [:show,:edit,:destroy,:update]

def index
	@articles = Article.all 
end

def show
	@comment = Comment.new	
	@comment.article_id = @article.id

end

def new
	@article = Article.new
	
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

def update
	@article.update(article_params)
	redirect_to article_path(@article), notice: "Article #{@article.title} Updated"
end

private
	def find_article
		@article = Article.find(params[:id])
	end

end
