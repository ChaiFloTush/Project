class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: :index
    
    def index
        params[:category] ? @category = params[:category] : @category = 'Latest'
        if @category == 'Latest'
            @articles = Article.all.order("created_at DESC")
        else
            @articles = Article.where(:category=>@category).order("created_at DESC")
        end
    end

    def show
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)
        @article.user_id = current_user.id
        if @article.save
            redirect_to @article, notice: t(:succcreate)
        else
            render 'new'
        end
    end 

    def edit
        redirect_to @article if current_user.id != @article.user_id
    end

    def update
        if @article.update(article_params)
            redirect_to @article, notice: t(:succcupdate)
        else
            render 'edit'
        end
    end

    def destroy
        @article.destroy
        redirect_to root_path, notice: t(:succdelete)
    end

    private

    def set_article
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :category, :image, :textbody)
    end
end
