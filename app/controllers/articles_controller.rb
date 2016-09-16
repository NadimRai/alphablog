class ArticlesController < ApplicationController

	def index
		@articles = Article.all
	end
	def new
		@article = Article.new
	end

	def show
		@article = Article.find(params[:id])
	end

	def create
		#render plain: params[:article].inspect
		@article = Article.new(article_params)
		if @article.save
			flash[:notice] = "Article was successfully created"
			redirect_to @article
		else
			render 'new'
		end
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		if @article.update(article_params)
			redirect_to @article , notice: "Article was successfully updated"
		else
			render 'edit'
		end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy 
		redirect_to articles_path,notice: "Article was successfull deleted"
	end

	private

	def article_params
		params.require(:article).permit(:title,:description)
	end
end