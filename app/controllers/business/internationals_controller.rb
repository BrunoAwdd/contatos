class Business::InternationalsController < ApplicationController
  before_action :set_business_international, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /business/internationals
  # GET /business/internationals.json
  def index
    @business_generals = Business::International.all
  end

  # GET /business/internationals/1
  # GET /business/internationals/1.json
  def show
  end

  # GET /business/internationals/new
  def new

    @business_general = Business::International.new
    #@business_general.histories.build
    #@business_general.histories.build
    @business_general.notes.build
    @business_general.intermediaries.build
    @business_general.contatos.build
  end

  # GET /business/internationals/1/edit
  def edit
    @business_general.histories.build
    @business_general.notes.build
    @business_general.contatos.build
    @business_general.intermediaries.build
  end

  # POST /business/internationals
  # POST /business/internationals.json
  def create
    @business_general = Business::International.new(business_international_params)

    respond_to do |format|
      if @business_general.save
        format.html { redirect_to @business_general, notice: 'International was successfully created.' }
        format.json { render :show, status: :created, location: @business_general }
      else
        format.html { render :new }
        format.json { render json: @business_general.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /business/internationals/1
  # PATCH/PUT /business/internationals/1.json
  def update
    respond_to do |format|
      if @business_general.update(business_international_params)
        format.html { redirect_to @business_general, notice: 'International was successfully updated.' }
        format.json { render :show, status: :ok, location: @business_general }
      else
        format.html { render :edit }
        format.json { render json: @business_general.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /business/internationals/1
  # DELETE /business/internationals/1.json
  def destroy
    @business_general.destroy
    respond_to do |format|
      format.html { redirect_to business_internationals_url, notice: 'International was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business_international
      begin
        @business_general = Business::International.find(params[:id])
      rescue
        @business_general = Business::General.find(params[:id])
        refirect_to @business_general
      end
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def business_international_params
      params.require(:business_international).permit(:id, :name, :date_entry, :subject,  :product_general_id, :conditions, :type,
                                                     {intermediary_contato_ids:[]},
                                                     {contato_ids:[]},
                                                     {histories_attributes: [:id, :date_entry, :note]},
                                                     {notes_attributes: [:id, :note]},
                                                     {intermediary_attributes: [:id, :note, :contato_id]}
      )

    end
end
