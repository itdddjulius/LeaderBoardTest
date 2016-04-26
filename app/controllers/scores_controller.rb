class ScoresController < ApplicationController
  before_action :set_score, only: [:show, :edit, :update, :destroy]
  # USE THIS IF YOU WANT TO FORCE LOGIN: before_action :authenticate, only: [:show, :edit, :update, :destroy]
  # GET /scores
  # GET /scores.json
  def index
  # :points makes the parameter take it in as a symbol, (like an unchangeable string, this is what it wants)
  # we changed this to .order(points: :desc) to force the scores to sort in highest to smallest mode, using the built-in order method
    @scores = Score.order(points: :desc)
  end

  # GET /scores/1
  # GET /scores/1.json
  def show
  end

  # GET /scores/new
  def new
    @score = Score.new
  end

  # GET /scores/1/edit
  def edit
  end

  # POST /scores
  # POST /scores.json
  def create
    @score = Score.new(score_params)

    respond_to do |format|
      if @score.save
        format.html { redirect_to @score, notice: 'Score was successfully created.' }
        format.json { render :show, status: :created, location: @score }
      else
        format.html { render :new }
        format.json { render json: @score.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scores/1
  # PATCH/PUT /scores/1.json
  def update
    respond_to do |format|
      if @score.update(score_params)
        format.html { redirect_to @score, notice: 'Score was successfully updated.' }
        format.json { render :show, status: :ok, location: @score }
      else
        format.html { render :edit }
        format.json { render json: @score.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scores/1
  # DELETE /scores/1.json
  def destroy
  if current_user.is_admin?
    @score.destroy
    respond_to do |format|
      format.html { redirect_to scores_url, notice: 'Score was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_score
      @score = Score.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def score_params
      params.require(:score).permit(:name, :points)
    end
    
    # GET /tag/:id/posts - this comment helps you to remember which URL will map to this method
    def by_score
      @score = Score.find(params[:id]) # remember, find will raise an error if the record is not found
    end
end
