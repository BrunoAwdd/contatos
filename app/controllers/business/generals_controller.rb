class Business::GeneralsController < ApplicationController
  before_action :set_business_general, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /business/generals
  # GET /business/generals.json
  def index
    @business_generals = Business::General.all
  end

  # GET /business/generals/1
  # GET /business/generals/1.json
  def show
  end

  # GET /business/generals/new
  def new

    @business_general = Business::General.new
    #@business_general.histories.build
    #@business_general.histories.build
    @business_general.notes.build
    @business_general.intermediaries.build
    @business_general.contatos.build
  end

  # GET /business/generals/1/edit
  def edit
    @business_general.histories.build
    @business_general.notes.build
    @business_general.contatos.build
    @business_general.intermediaries.build
  end

  # POST /business/generals
  # POST /business/generals.json
  def create
    @business_general = Business::General.new(business_general_params)

    respond_to do |format|
      if @business_general.save
        format.html { redirect_to @business_general, notice: 'General was successfully created.' }
        format.json { render :show, status: :created, location: @business_general }
      else
        format.html { render :new }
        format.json { render json: @business_general.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /business/generals/1
  # PATCH/PUT /business/generals/1.json
  def update
    respond_to do |format|
      if @business_general.update(business_general_params)
        format.html { redirect_to @business_general, notice: 'General was successfully updated.' }
        format.json { render :show, status: :ok, location: @business_general }
      else
        format.html { render :edit }
        format.json { render json: @business_general.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /business/generals/1
  # DELETE /business/generals/1.json
  def destroy
    @business_general.destroy
    respond_to do |format|
      format.html { redirect_to business_generals_url, notice: 'General was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business_general
      @business_general = Business::General.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def business_general_params
      params.require(:business_general).permit(:id, :name, :date_entry, :subject,  :product_general_id, :conditions, :type,
                                               {intermediary_contato_ids:[]},
                                               {contato_ids:[]},
                                               {histories_attributes: [:id, :date_entry, :note]},
                                               {notes_attributes: [:id, :note]},
                                               {intermediary_attributes: [:id, :note, :contato_id]}
      )

    end
end
