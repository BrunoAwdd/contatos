class Credit::DocumentsController < ApplicationController
  before_action :set_credit_document, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /credit/documents
  # GET /credit/documents.json
  def index
    @credit_documents = Credit::Document.all
  end

  # GET /credit/documents/1
  # GET /credit/documents/1.json
  def show
  end

  # GET /credit/documents/new
  def new
    @credit_document = Credit::Document.new
  end

  # GET /credit/documents/1/edit
  def edit
  end

  # POST /credit/documents
  # POST /credit/documents.json
  def create
    @credit_document = Credit::Document.new(credit_document_params)

    respond_to do |format|
      if @credit_document.save
        format.html { redirect_to @credit_document, notice: 'Document was successfully created.' }
        format.json { render :show, status: :created, location: @credit_document }
      else
        format.html { render :new }
        format.json { render json: @credit_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /credit/documents/1
  # PATCH/PUT /credit/documents/1.json
  def update
    respond_to do |format|
      if @credit_document.update(credit_document_params)
        format.html { redirect_to @credit_document, notice: 'Document was successfully updated.' }
        format.json { render :show, status: :ok, location: @credit_document }
      else
        format.html { render :edit }
        format.json { render json: @credit_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /credit/documents/1
  # DELETE /credit/documents/1.json
  def destroy
    @credit_document.destroy
    respond_to do |format|
      format.html { redirect_to credit_documents_url, notice: 'Document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_credit_document
      @credit_document = Credit::Document.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def credit_document_params
      params.require(:credit_document).permit(:name, :frequency_unity, :frequency_number)
    end
end
