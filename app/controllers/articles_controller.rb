class ArticlesController < ApplicationController
    include ArticlesHelper    

    before_action :require_login, only: [:new, :create, :edit, :update, :destroy]
    before_action :check_for_cancel, :only => [:create, :update]

    def check_for_cancel
        redirect_to authors_path if params[:commit] == "Cancel"
    end    

    def index
        #@articles = Article.all
        @articles = Article.order('articles.view_count DESC').limit(3);      
    end

    def show
        @article = Article.find(params[:id])

        @comment = Comment.new
        @comment.article_id = @article.id

        @article.increment_visitors;
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
        
        flash.notice = "Article '#{@article.title}' Created!"

        redirect_to article_path(@article)
    end

    def destroy 
        #@article = Article.find(params[:id])
        @title = Article.find(params[:id]).title  
        #@article = Article.find(22)
        #@article.taggings.delete(8)
        #@article.taggings.destroy(9)       

        Article.destroy(params[:id])
        flash.notice = "Article '#{@title}' Deleted!"

        redirect_to articles_path
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])      
        @article.update(article_params)

        flash.notice = "Article '#{@article.title}' Updated!"

        redirect_to article_path(@article)
    end
end
