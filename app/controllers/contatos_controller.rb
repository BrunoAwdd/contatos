class ContatosController < ApplicationController
  before_action :set_contato, only: [:show, :edit, :update, :destroy]
  before_action :seasson_controller, only:[:index]
  before_action :authenticate_user!
  require 'csv'


  def initialize
    super
    @where = ''
  end


  # GET /contatos
  # GET /contatos.json
  def index
    if !params[:filter].blank?
      params[:filter] = nil
      redirect_to contatos_path
    end

    if session[:filter].blank?
      @contatos = Contato.paginate(:page => session[:pagination][:page], :per_page => session[:pagination][:per_page])
    else
      filtrar_contatos
    end
  end

  # GET /contatos/1
  # GET /contatos/1.json
  def show
    logger.debug "----------------------Show--------------------------:"
  end

  # GET /contatos/new
  def new
    @contato = Contato.new
    build_contato
  end

  # GET /contatos/1/edit
  def edit
    @contato.emails.build
    @contato.telefones.build
    @contato.enderecos.build
    @contato.product_generals.build
  end

  # POST /contatos
  # POST /contatos.json
  def create
    @contato = Contato.new(contato_params)
    respond_to do |format|
      if @contato.save
        format.html { redirect_to @contato, notice: 'Contato was successfully created.' }
        format.json { render :show, status: :created, location: @contato }
      else
        format.html { render :new }
        format.json { render json: @contato.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contatos/1
  # PATCH/PUT /contatos/1.json
  def update
    #ContatoMailer.hello_email(@contato).deliver_later
    respond_to do |format|
      if @contato.update(contato_params)
        format.html { redirect_to @contato, notice: 'Contato was successfully updated.' }
        format.json { render :show, status: :ok, location: @contato }
      else
        format.html { render :edit }
        format.json { render json: @contato.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contatos/1
  # DELETE /contatos/1.json
  def destroy
    @contato.destroy
    url = get_page_url
    respond_to do |format|
      format.html { redirect_to url, notice: 'Contato was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # POST /contatos/1
  # POST /contatos/1.json
  def mass_action
    url = get_page_url
    if !params[:mass].blank?
      if params[:mass]['action'] == 'delete'
        Contato.destroy(params[:mass]['id'])

        respond_to do |format|
          format.html { redirect_to url, notice: 'Contatos deletados com sucesso' }
          format.json { head :no_content }
        end
      else
        redirect_to contatos_url
      end
    end
  end

  def migrate

    csv_text = File.read('public/contacts.csv')
    csv = CSV.parse(csv_text, :headers => true)
    #render plain: csv.to_json
    render plain: csv["Name"].to_json
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contato
      @contato = Contato.find(params[:id])
    end

    def get_page_url
      if session[:pagination]["page"].blank?
        url = contatos_url
      else
        url = contatos_url + '?page=' + session[:pagination]["page"]
      end
    end

    #build contact relationships
    def build_contato
      @contato.emails.build
      @contato.telefones.build
      @contato.enderecos.build
      @contato.product_generals.build
    end

    #Inicia a Session para armazenar os valores de filtro
    def seasson_controller
      if session[:pagination].blank?
        session[:pagination] = {:page => 1, :per_page => 50}
        session[:filter] = {
            :id => '',
            :name => '',
            :telefone => '',
            :email => '',
            :tag => '',
        }
      end

      if !params[:page].blank?
        session[:pagination][:page] = params['page']
      end

      if !params[:filter].blank?
        session[:pagination] = {:per_page => params[:filter]['per_page']}
        session[:filter] = {
            :id => params[:filter]['id'],
            :name => params[:filter]['name'],
            :telefone => params[:filter]['telefone'],
            :email => params[:filter]['email'],
            :tag => params[:filter]['tag'],
        }
      end

    end

    def filtrar_contatos
      if session[:pagination]['per_page'] != 'Todos'
        @contatos = Contato.joins(
                               #LEFT JOIN contatos_product_generals ON contatos_products.contato_id = contatos.id
            "LEFT JOIN telefones ON telefones.contato_id = contatos.id
            LEFT JOIN contatos_product_generals ON contatos_product_generals.contato_id = contatos.id
            LEFT JOIN product_generals ON contatos_product_generals.product_generals_id = product_generals.id
            LEFT JOIN emails ON emails.contato_id = contatos.id ")
                        .where(filterWhere(session[:filter]))
                        .group('contatos.id')
                        .paginate(:page => session[:pagination][:page], :per_page => session[:pagination]['per_page'])
                        #.order('contatos.first_name ASC')
      else
        @contatos = Contato.joins(
            "LEFT JOIN telefones ON telefones.contato_id = contatos.id
            LEFT JOIN emails ON emails.contato_id = contatos.id ")
                        .where(filterWhere(session[:filter]))
                        .group('contatos.id')
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contato_params
      params.require(:contato).permit(
            :first_name, :last_name, :email, :email2, :home_fone, :business_fone, :mobile_fone, :home_city, :home_state, :home_country, :notes, :web_page, :filter,
            {product_general_ids:[]},
            {emails_attributes:[:id, :email, :_destroy]},
            {enderecos_attributes:[:id, :tipo, :endereco, :cidade, :estado, :pais, :_destroy]},
            {telefones_attributes: [:id, :ddd, :tipo, :telefone, :_destroy]}
      )

    end


  def migrate_email
    @contatos = Contato.all
    @contatos.each do |contato|
      if !contato.email.blank?
        contato.emails.push(Email.new ({'email' => contato.email}))
      end
      if !contato.email2.blank?
        contato.emails.push(Email.new ({'email' => contato.email2}))
      end
    end
    render plain: @contatos.to_json
  end

  def migrate_telefone
    @contatos = Contato.all

    @contatos.each do |contato|
      if !contato.home_fone.blank?
        telefone_number = contato.home_fone
        telefone = {"tipo" => "Telefone Residencial", "telefone" => telefone_number,  "ddd" => ''}
        contato.telefones.push(Telefone.new(telefone))
      end
      if !contato.mobile_fone.blank?
        telefone_number = contato.mobile_fone
        telefone = {"tipo" => "Celular", "telefone" => telefone_number,  "ddd" => ''}
        contato.telefones.push(Telefone.new(telefone))
      end
      if !contato.business_fone.blank?
        telefone_number = contato.business_fone
        telefone = {"tipo" => "Telefone Comercial", "telefone" => telefone_number,  "ddd" => ''}
        contato.telefones.push(Telefone.new(telefone))
      end
    end
  end

  def migrate_endereco
    @contatos = Contato.all

    @contatos.each do |contato|
      if !contato.home_city.blank? || !contato.home_state.blank? || !contato.home_country.blank?
        contato_cidade   = contato.home_city
        contato_estado   = contato.home_state
        contato_pais     = contato.home_country
        endereco = {"tipo" => "residencial", "cidade" => contato_cidade, "estado" => contato_estado, "pais" => contato_pais}
        contato.enderecos.push Endereco.new endereco
      end
    end

    render plain: @contatos[1043].to_yaml

  end

  def filterWhere(params)

    if !params['id'].blank?
      addWhere("contatos.id LIKE \"%#{params['id']}%\"")
    end

    if !params['name'].blank?
      addWhere("(first_name LIKE \"%#{params['name']}%\" OR last_name LIKE \"%#{params['name']}%\")")
    end

    if !params['telefone'].blank?
      addWhere("telefones.telefone LIKE \"%#{params['telefone']}%\"")
    end

    if !params['tag'].blank?
      addWhere("product_generals.nome LIKE \"%#{params['product']}%\"")
    end

    if !params['email'].blank?
      addWhere(" emails.email LIKE \"%#{params['email']}%\"")
    end

    @where

  end

  def addWhere (clause)
    if !@where.blank?
      @where = @where + ' AND ' + clause
    else
      @where =  clause
    end
  end


end
