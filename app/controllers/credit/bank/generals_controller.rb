class Credit::Bank::GeneralsController < ApplicationController
  before_action :set_credit_bank_general, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /credit/bank/generals
  # GET /credit/bank/generals.json
  def index
    @credit_bank_generals = Credit::Bank::General.all
  end

  # GET /credit/bank/generals/1
  # GET /credit/bank/generals/1.json
  def show
  end

  # GET /credit/bank/generals/new
  def new
    @credit_bank_general = Credit::Bank::General.new
    @credit_bank_general.phones.build
    @credit_bank_general.emails.build
    @credit_bank_general.addresses.build
  end

  # GET /credit/bank/generals/1/edit
  def edit
  end

  # POST /credit/bank/generals
  # POST /credit/bank/generals.json
  def create
    @credit_bank_general = Credit::Bank::General.new(credit_bank_general_params)

    respond_to do |format|
      if @credit_bank_general.save
        format.html { redirect_to @credit_bank_general, notice: 'General was successfully created.' }
        format.json { render :show, status: :created, location: @credit_bank_general }
      else
        format.html { render :new }
        format.json { render json: @credit_bank_general.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /credit/bank/generals/1
  # PATCH/PUT /credit/bank/generals/1.json
  def update
    respond_to do |format|
      if @credit_bank_general.update(credit_bank_general_params)
        format.html { redirect_to @credit_bank_general, notice: 'General was successfully updated.' }
        format.json { render :show, status: :ok, location: @credit_bank_general }
      else
        format.html { render :edit }
        format.json { render json: @credit_bank_general.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /credit/bank/generals/1
  # DELETE /credit/bank/generals/1.json
  def destroy
    @credit_bank_general.destroy
    respond_to do |format|
      format.html { redirect_to credit_bank_generals_url, notice: 'General was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_credit_bank_general
      @credit_bank_general = Credit::Bank::General.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def credit_bank_general_params
      params.require(:credit_bank_general).permit(:name, :agency, :contato_id,
                                          addresses_attributes: [:id, :street, :number, :neighborhood, :city, :state, :country, :zipcode, :_destroy],
                                          email_attributes: [:id, :email, :_destroy],
                                          phone_attributes: [:id, :ddd, :telefone, :tipo, :_destroy]
      )

    end
end
