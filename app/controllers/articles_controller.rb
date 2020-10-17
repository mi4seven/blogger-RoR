class ArticlesController < ApplicationController
end


def index
    @articles = Article.all
end