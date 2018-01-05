class Business::HistoriesController < ApplicationController
  before_action :set_business_history, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /business/histories
  # GET /business/histories.json
  def index
    @business_histories = Business::History.all
  end

  # GET /business/histories/1
  # GET /business/histories/1.json
  def show
  end

  # GET /business/histories/new
  def new
    @business_history = Business::History.new
  end

  # GET /business/histories/1/edit
  def edit
  end

  # POST /business/histories
  # POST /business/histories.json
  def create
    @business_history = Business::History.new(business_history_params)

    respond_to do |format|
      if @business_history.save
        format.html { redirect_to @business_history, notice: 'History was successfully created.' }
        format.json { render :show, status: :created, location: @business_history }
      else
        format.html { render :new }
        format.json { render json: @business_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /business/histories/1
  # PATCH/PUT /business/histories/1.json
  def update
    respond_to do |format|
      if @business_history.update(business_history_params)
        format.html { redirect_to @business_history, notice: 'History was successfully updated.' }
        format.json { render :show, status: :ok, location: @business_history }
      else
        format.html { render :edit }
        format.json { render json: @business_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /business/histories/1
  # DELETE /business/histories/1.json
  def destroy
    @business_history.destroy
    respond_to do |format|
      format.html { redirect_to business_histories_url, notice: 'History was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business_history
      @business_history = Business::History.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def business_history_params
      params.require(:business_history).permit(:data_entry, :note, :business_general_id)
    end
end
