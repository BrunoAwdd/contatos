class Credit::Client::Warranty::DocumentsListsController < ApplicationController
  before_action :set_credit_client_warranty_documents_list, only: [:show, :edit, :update, :destroy]

  # GET /credit/client/warranty/documents_lists
  # GET /credit/client/warranty/documents_lists.json
  def index
    @credit_client_warranty_documents_lists = Credit::Client::Warranty::DocumentsList.all
  end

  # GET /credit/client/warranty/documents_lists/1
  # GET /credit/client/warranty/documents_lists/1.json
  def show
  end

  # GET /credit/client/warranty/documents_lists/new
  def new
    @credit_client_warranty_documents_list = Credit::Client::Warranty::DocumentsList.new
  end

  # GET /credit/client/warranty/documents_lists/1/edit
  def edit
  end

  # POST /credit/client/warranty/documents_lists
  # POST /credit/client/warranty/documents_lists.json
  def create
    @credit_client_warranty_documents_list = Credit::Client::Warranty::DocumentsList.new(credit_client_warranty_documents_list_params)

    respond_to do |format|
      if @credit_client_warranty_documents_list.save
        format.html { redirect_to @credit_client_warranty_documents_list, notice: 'Documents list was successfully created.' }
        format.json { render :show, status: :created, location: @credit_client_warranty_documents_list }
      else
        format.html { render :new }
        format.json { render json: @credit_client_warranty_documents_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /credit/client/warranty/documents_lists/1
  # PATCH/PUT /credit/client/warranty/documents_lists/1.json
  def update
    respond_to do |format|
      if @credit_client_warranty_documents_list.update(credit_client_warranty_documents_list_params)
        format.html { redirect_to @credit_client_warranty_documents_list, notice: 'Documents list was successfully updated.' }
        format.json { render :show, status: :ok, location: @credit_client_warranty_documents_list }
      else
        format.html { render :edit }
        format.json { render json: @credit_client_warranty_documents_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /credit/client/warranty/documents_lists/1
  # DELETE /credit/client/warranty/documents_lists/1.json
  def destroy
    @credit_client_warranty_documents_list.destroy
    respond_to do |format|
      format.html { redirect_to credit_client_warranty_documents_lists_url, notice: 'Documents list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_credit_client_warranty_documents_list
      @credit_client_warranty_documents_list = Credit::Client::Warranty::DocumentsList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def credit_client_warranty_documents_list_params
      params.require(:credit_client_warranty_documents_list).permit(:name, :frequency_unity, :frequency_number)
    end
end
