class ArticlesController < ApplicationController
      skip_before_action :only_signed_in, only: [:index, :show]

    before_action :article_find, only:[:show, :update, :edit, :destroy]

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
        @article = Article.new(article_params)
        @article.save
        redirect_to @article
    end

    def update
        article = article_find
        @article.update_attributes(article_params)
        if @article.valid?
            redirect_to article_path(@article)
        else
            redirect_to edit_article_path(@article)
        end
    end

    def destroy
        @article = article_find
        @article.destroy

        redirect_to articles_path
    end

    private
        def article_params
            params.require(:article).permit(:title, :date, :image, :header, :body, :author) #Manque l'auteur : provoque erreur (:author)
        end
    private
        def article_find
            @article = Article.find(params[:id])
        end

end
