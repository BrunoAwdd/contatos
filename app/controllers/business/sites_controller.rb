class Business::SitesController < Business::GeneralsController
  before_action :set_business_site, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /business/sites
  # GET /business/sites.json
  def index
    @business_generals = Business::Site.all
  end


  # GET /business/sites/new
  def new

    @business_general = Business::Site.new
    #@business_general.histories.build
    #@business_general.histories.build
    @business_general.notes.build
    @business_general.intermediaries.build
    @business_general.contatos.build
  end


  # POST /business/sites
  # POST /business/sites.json
  def create
    @business_general = Business::Site.new(business_site_params)

    respond_to do |format|
      if @business_general.save
        format.html { redirect_to @business_general, notice: 'Site was successfully created.' }
        format.json { render :show, status: :created, location: @business_general }
      else
        format.html { render :new }
        format.json { render json: @business_general.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /business/sites/1
  # PATCH/PUT /business/sites/1.json
  def update
    respond_to do |format|
      if @business_general.update(business_site_params)
        format.html { redirect_to @business_general, notice: 'Site was successfully updated.' }
        format.json { render :show, status: :ok, location: @business_general }
      else
        format.html { render :edit }
        format.json { render json: @business_general.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /business/sites/1
  # DELETE /business/sites/1.json
  def destroy
    @business_general.destroy
    respond_to do |format|
      format.html { redirect_to business_sites_url, notice: 'Site was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_business_site
    begin
      @business_general = Business::Site.find(params[:id])
    rescue
      @business_general = Business::General.find(params[:id])
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def business_site_params
    params.require(:business_site).permit(:id, :name, :date_entry, :subject,  :product_general_id, :conditions, :type,
                                              {intermediary_contato_ids:[]},
                                              {contato_ids:[]},
                                              {histories_attributes: [:id, :date_entry, :note]},
                                              {notes_attributes: [:id, :note]},
                                              {intermediary_attributes: [:id, :note, :contato_id]}
    )
  end
end
