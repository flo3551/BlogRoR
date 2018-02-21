class CommentairesController < ApplicationController
  before_action :set_commentaire, only: [:show, :edit, :update, :destroy]
  before_action :article_find, only: [:new]

  # GET /commentaires
  # GET /commentaires.json
  def index
    @commentaires = Commentaire.all
  end

  # GET /commentaires/1
  # GET /commentaires/1.json
  def show
  end

  # GET /commentaires/new
  def new
    @commentaire = Commentaire.new
  end

  # GET /commentaires/1/edit
  def edit
  end

  # POST /commentaires
  # POST /commentaires.json
  def create
    @article = article_find
    @commentaire = @article.commentaires.create(params[:commentaire].permit(:pseudo, :body)) #Commentaire.new(commentaire_params)
      if @commentaire.save
        redirect_to article_path(@article)
        #format.html { redirect_to @commentaire, notice: 'Commentaire was successfully created.' }
        #format.json { render :show, status: :created, location: @commentaire }
      else
        render "new"
        #format.html { render :new }
        #format.json { render json: @commentaire.errors, status: :unprocessable_entity }
      end
  end

  # PATCH/PUT /commentaires/1
  # PATCH/PUT /commentaires/1.json
  def update
    respond_to do |format|
      if @commentaire.update(commentaire_params)
        format.html { redirect_to @commentaire, notice: 'Commentaire was successfully updated.' }
        format.json { render :show, status: :ok, location: @commentaire }
      else
        format.html { render :edit }
        format.json { render json: @commentaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /commentaires/1
  # DELETE /commentaires/1.json
  def destroy
    @commentaire.destroy
    respond_to do |format|
      format.html { redirect_to commentaires_url, notice: 'Commentaire was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_commentaire
      @commentaire = Commentaire.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def commentaire_params
      params.require(:commentaire).permit(:pseudo, params[:article_id],:body)
    end


    private 
      def article_find
        @article = Article.find(params[:article_id])
      end
end
