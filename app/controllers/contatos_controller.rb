class ContatosController < ApplicationController
  before_action :set_contato, only: [:show, :edit, :update, :destroy]
  before_action :build_contato, only:[:new, :edit]

  # GET /contatos
  # GET /contatos.json
  def index
    @contatos = Contato.all
  end

  # GET /contatos/1
  # GET /contatos/1.json
  def show
  end

  # GET /contatos/new
  def new
    @contato = Contato.new
  end

  # GET /contatos/1/edit
  def edit
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
    respond_to do |format|
      format.html { redirect_to contatos_url, notice: 'Contato was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def migrate
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contato
      @contato = Contato.find(params[:id])
    end

    def build_contato
      @contato.emails.build
      @contato.telefones.build
      @contato.enderecos.build

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contato_params
      params.require(:contato).permit(:first_name, :last_name, :email, :email2, :home_fone, :business_fone, :mobile_fone, :home_city, :home_state, :home_country, :notes, :web_page, product_ids:[], emails_attributes:[:id, :email, :_destroy], telefones_attributes:[:id, :ddd, :tipo, :telefone, :_destroy], enderecos_attributes:[:id, :tipo, :endereco, :cidade, :estado, :pais])
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

end
