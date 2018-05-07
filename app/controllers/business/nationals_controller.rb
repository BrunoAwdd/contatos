class Business::NationalsController < Business::GeneralsController
  before_action :set_business_national, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /business/nationals
  # GET /business/nationals.json
  def index
    @business_generals = Business::National.all
  end


  # GET /business/nationals/new
  def new

    @business_general = Business::National.new
    #@business_general.histories.build
    #@business_general.histories.build
    @business_general.notes.build
    @business_general.intermediaries.build
    @business_general.contatos.build
  end


  # POST /business/nationals
  # POST /business/nationals.json
  def create
    @business_general = Business::National.new(business_national_params)

    respond_to do |format|
      if @business_general.save
        format.html { redirect_to @business_general, notice: 'National was successfully created.' }
        format.json { render :show, status: :created, location: @business_general }
      else
        format.html { render :new }
        format.json { render json: @business_general.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /business/nationals/1
  # PATCH/PUT /business/nationals/1.json
  def update
    respond_to do |format|
      if @business_general.update(business_national_params)
        format.html { redirect_to @business_general, notice: 'National was successfully updated.' }
        format.json { render :show, status: :ok, location: @business_general }
      else
        format.html { render :edit }
        format.json { render json: @business_general.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /business/nationals/1
  # DELETE /business/nationals/1.json
  def destroy
    @business_general.destroy
    respond_to do |format|
      format.html { redirect_to business_nationals_url, notice: 'National was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_business_national
    begin
      @business_general = Business::National.find(params[:id])
    rescue
      @business_general = Business::General.find(params[:id])
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def business_national_params
    params.require(:business_national).permit(:id, :name, :date_entry, :subject,  :product_general_id, :conditions, :type,
                                              {intermediary_contato_ids:[]},
                                              {contato_ids:[]},
                                              {histories_attributes: [:id, :date_entry, :note]},
                                              {notes_attributes: [:id, :note]},
                                              {intermediary_attributes: [:id, :note, :contato_id]}
    )
  end
end
