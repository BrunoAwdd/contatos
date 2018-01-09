class Credit::Client::Partner::BasesController < ApplicationController
  before_action :set_credit_client_partner_basis, only: [:show, :edit, :update, :destroy]

  # GET /credit/client/partner/bases
  # GET /credit/client/partner/bases.json
  def index
    @credit_client_partner_bases = Credit::Client::Partner::Base.all
  end

  # GET /credit/client/partner/bases/1
  # GET /credit/client/partner/bases/1.json
  def show
  end

  # GET /credit/client/partner/bases/new
  def new
    @credit_client_partner_basis = Credit::Client::Partner::Base.new
  end

  # GET /credit/client/partner/bases/1/edit
  def edit
  end

  # POST /credit/client/partner/bases
  # POST /credit/client/partner/bases.json
  def create
    @credit_client_partner_basis = Credit::Client::Partner::Base.new(credit_client_partner_basis_params)

    respond_to do |format|
      if @credit_client_partner_basis.save
        format.html { redirect_to @credit_client_partner_basis, notice: 'Base was successfully created.' }
        format.json { render :show, status: :created, location: @credit_client_partner_basis }
      else
        format.html { render :new }
        format.json { render json: @credit_client_partner_basis.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /credit/client/partner/bases/1
  # PATCH/PUT /credit/client/partner/bases/1.json
  def update
    respond_to do |format|
      if @credit_client_partner_basis.update(credit_client_partner_basis_params)
        format.html { redirect_to @credit_client_partner_basis, notice: 'Base was successfully updated.' }
        format.json { render :show, status: :ok, location: @credit_client_partner_basis }
      else
        format.html { render :edit }
        format.json { render json: @credit_client_partner_basis.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /credit/client/partner/bases/1
  # DELETE /credit/client/partner/bases/1.json
  def destroy
    @credit_client_partner_basis.destroy
    respond_to do |format|
      format.html { redirect_to credit_client_partner_bases_url, notice: 'Base was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_credit_client_partner_basis
      @credit_client_partner_basis = Credit::Client::Partner::Base.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def credit_client_partner_basis_params
      params.require(:credit_client_partner_basis).permit(:name, :credit_client_general_id)
    end
end
