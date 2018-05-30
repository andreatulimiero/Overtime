class ArticlesController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]

    def new
        @article = Article.new
    end

    def edit
        @article = Article.find(params[:id])
    end

    def index
        @articles = Article.all
    end

    def show
        @article = Article.find params[:id]
    end

    def create
        @article = Article.new articles_params
        if @article.save
            redirect_to @article
        else
            render 'new'
        end
    end

    def update
        if @user == current_user || current_user.admin?
            @article = Article.find(params[:id])
            @article.update(article_params)
          
            redirect_to @article
        else
          redirect_to root_path
        end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
 
        redirect_to articles_path
    end

    private 
        def articles_params
            params.require(:article).permit(:title, :body)
        end
end
