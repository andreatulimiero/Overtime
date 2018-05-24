class ArticlesController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]

    def new

    end

    def index
        @articles = Article.all

        render plain: @articles.length
    end

    def show
        @article = Article.find params[:id]

        render plain: @article.title + @article.body
    end

    def create
        @article = Article.new articles_params
        if @article.save
            redirect_to @article
        else
            render 'new'
        end

        render plain: @article.title + "created"
    end

    def update
        @article = Article.find(params[:id])
       
        if @article.update(article_params)
          redirect_to @article
        else
          render 'edit'
        end
    end

    def destroy
        @article = Article.find params[:id]
        @article.destroy

        render plain: @article.title + "destroyed"
    end

    private 
        def articles_params
            params.require(:article).permit(:title, :text)
        end
end
