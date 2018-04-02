class Credit::Client::GeneralsController < ApplicationController
  before_action :set_credit_client_general, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :hidrateEdit, only: [:edit]

  # GET /credit/client/generals
  # GET /credit/client/generals.json
  def index
    @credit_client_generals = Credit::Client::General.all
  end

  # GET /credit/client/generals/1
  # GET /credit/client/generals/1.json
  def show
  end

  # GET /credit/client/generals/new
  def new
    Rails.logger.debug "Year: #{Time.now.year}"
    @credit_client_general = Credit::Client::General.new
    @credit_client_general.build_intermediary
    @credit_client_general.documents_build
    @credit_client_general.partners.build
    @credit_client_general.contatos.build
    @credit_client_general.credit_client_contatos.build
    hidrateEdit
  end

  # GET /credit/client/generals/1/edit
  def edit
  end

  # POST /credit/client/generals
  # POST /credit/client/generals.json
  def create
    @credit_client_general = Credit::Client::General.new(credit_client_general_params)

    respond_to do |format|
      if @credit_client_general.save
        format.html { redirect_to @credit_client_general, notice: 'General was successfully created.' }
        format.json { render :show, status: :created, location: @credit_client_general }
      else
        format.html { render :new }
        format.json { render json: @credit_client_general.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /credit/client/generals/1
  # PATCH/PUT /credit/client/generals/1.json
  def update

    respond_to do |format|
      if @credit_client_general.update(credit_client_general_params)
        format.html { redirect_to @credit_client_general, notice: 'General was successfully updated.' }
        format.json { render :show, status: :ok, location: @credit_client_general }
      else
        format.html { render :edit }
        format.json { render json: @credit_client_general.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /credit/client/generals/1
  # DELETE /credit/client/generals/1.json
  def destroy
    @credit_client_general.destroy
    respond_to do |format|
      format.html { redirect_to credit_client_generals_url, notice: 'General was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def find_expired
    service = ExpirationService.new
    render plain: service.expiredDocs
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_credit_client_general
      @credit_client_general = Credit::Client::General.find(params[:id])
    end

    def set_partners_documents
      @credit_client_general.partners.each do |partner|
        partner.documents_build
      end
    end

    def set_warranties_documents
      @credit_client_general.warranties.each do |warranty|
        warranty.documents_build
      end
    end

    def hidrateEdit
      @credit_client_general.contatos.build
      @credit_client_general.documents_build
      set_partners_documents
      set_warranties_documents
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def credit_client_general_params
      params.require(:credit_client_general).permit(:id, :name, :brand, :cnpj, :condition, contato_ids:[],
                  addresses_attributes: [:id, :street, :number, :neighborhood, :city, :state, :country, :zipcode, :_destroy],
                  credit_client_contatos_attributes: [:id, :credit_client_id, :contato_id,
                                                      contato_attributes: [:id, :first_name, :last_name, :web_page,  :_destroy,
                                                                      email_attributes: [:id, :email, :_destroy],
                                                                      phone_attributes: [:id, :ddd, :telefone, :tipo, :_destroy]
                                                                            ],
                                                ],
                  phones_attributes: [:id, :ddd, :phone, :model, :_destroy],
                  emails_attributes: [:id, :email, :contact, :_destroy],
                  lines_attributes: [:id, :name, :value, :credit_bank_general_id, :date, :status, :note, :_destroy],
                  documents_attributes: [:id, :status, :date, :exemption, :credit_document_id, :_destroy],
                  partners_attributes: [:id, :contato_id,
                            contatos_attributes: [:id, :first_name, :last_name, :web_page,  :_destroy,
                                                  email_attributes: [:id, :email, :_destroy],
                                                  phone_attributes: [:id, :ddd, :telefone, :tipo, :_destroy]
                            ],
                            partner_documents_attributes: [:id, :document_list_id, :status, :exemption, :date, :_destroy]
                  ],
                  warranties_attributes: [:id, :name,
                            warranty_address_attributes: [:id, :street, :number, :neighborhood, :city, :state, :country, :zipcode],
                            warranty_documents_attributes: [:id, :document_list_id, :status, :exemption, :date, :_destroy],
                            warranty_info_attributes: [:id, :value, :price, :condition, :notes]
                  ],
                  notes_attributes: [:id, :date, :note, :_destroy],
                  legals_attributes: [:id, :number, :date, :_destroy, :note],
                  intermediary_attributes: [:id, :name, :note, :contato_id, contato_attributes: [:id, :first_name, :last_name, :web_page,  :_destroy,
                                                                                     email_attributes: [:id, :email, :_destroy],
                                                                                     phone_attributes: [:id, :ddd, :telefone, :tipo, :_destroy]
                  ]]
      )
    end
end
