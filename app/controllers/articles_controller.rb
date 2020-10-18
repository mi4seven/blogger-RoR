class ArticlesController < ApplicationController
    include ArticlesHelper

    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
    end

    def new
        @article = Article.new
    end

    def create
        #4) use helper para,s
        @article = Article.new(article_params)

        #3) use params hash
        #@article = Article.new(params[:article]) 
            
        #2)
        #@article = Article.new(
        #title: params[:article][:title],
        #body: params[:article][:body])  
        
        #1)
        #@article = Article.new
        #@article.title = params[:article][:title]
        #@article.body = params[:article][:body]        
        
        @article.save

        redirect_to article_path(@article)
    end

    def destroy
        Article.destroy(params[:id])
        redirect_to articles_path
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
        @article.update(article_params)
      
        redirect_to article_path(@article)
    end
end



