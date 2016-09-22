class NewslettersController < ApplicationController
  before_action :set_newsletter, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /newsletters
  # GET /newsletters.json
  def index
    @newsletters = Newsletter.all
  end

  # GET /newsletters/1
  # GET /newsletters/1.json
  def show
  end

  # GET /newsletters/new
  def new
    @newsletter = Newsletter.new
  end

  # GET /newsletters/1/edit
  def edit
  end

  # POST /newsletters
  # POST /newsletters.json
  def create
    @newsletter = Newsletter.new(newsletter_params)

    respond_to do |format|
      if @newsletter.save
        format.html { redirect_to @newsletter, notice: 'Newsletter was successfully created.' }
        format.json { render :show, status: :created, location: @newsletter }
      else
        format.html { render :new }
        format.json { render json: @newsletter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /newsletters/1
  # PATCH/PUT /newsletters/1.json
  def update
    respond_to do |format|
      if @newsletter.update(newsletter_params)
        format.html { redirect_to @newsletter, notice: 'Newsletter was successfully updated.' }
        format.json { render :show, status: :ok, location: @newsletter }
      else
        format.html { render :edit }
        format.json { render json: @newsletter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /newsletters/1
  # DELETE /newsletters/1.json
  def destroy
    @newsletter.destroy
    respond_to do |format|
      format.html { redirect_to newsletters_url, notice: 'Newsletter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /newsletters/1/send
  def send_newsletter
    @newsletter = Newsletter.find(params[:newsletter_id])
    @produtos = Product.joins(
        "LEFT JOIN newsletters_products ON newsletters_products.newsletter_id = #{params[:newsletter_id]}
         LEFT JOIN contatos_products ON contatos_products.product_id = products.id
         LEFt JOIN contatos ON contatos_products.contato_id = contatos.id"
    )
    @contatos = @produtos[0].contatos
  end

  # POST /newsletters/1/send
  def send_mail
    @newsletter = Newsletter.find(params[:newsletter_id])
    @email = Email.find(params[:id])
    ContatoMailer.hello_email(email.contato, @newsletter).deliver_later

    render plain: @email.contato.to_json
=begin
    @newsletter = Newsletter.find(params[:newsletter_id])
    @emails = Email.find(params[:mass][:id])
    @emails.each do |email|
      #ContatoMailer.hello_email(email.contato, @newsletter).deliver_later
    end
    respond_to do |format|
      format.html { redirect_to @newsletter, notice: 'Enviado com sucesso.' }
      format.json { render :show, status: :ok, location: @newsletter }
    end
=end
  end

  # GET /newsletters/1/send
  def send_newsletterbkp
    @newsletter = Newsletter.find(params[:newsletter_id])
    @newsletter.products.each do |product|
      product.contatos.each do |contato|
        ContatoMailer.hello_email(contato, @newsletter).deliver_later
      end
    end
    respond_to do |format|
      format.html { redirect_to @newsletter, notice: 'Emviado com sucesso.' }
      format.json { render :show, status: :ok, location: @newsletter }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_newsletter
      @newsletter = Newsletter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def newsletter_params
      params.require(:newsletter).permit(:subject, :html_message, :text_message, :status, product_ids:[])
    end
end
