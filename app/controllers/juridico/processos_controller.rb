class Juridico::ProcessosController < ApplicationController
  before_action :set_juridico_processo, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  # GET /juridico/processos
  # GET /juridico/processos.json
  def index
    @juridico_processos = Juridico::Processo.all
  end

  # GET /juridico/processos/1
  # GET /juridico/processos/1.json
  def show
  end

  # GET /juridico/processos/new
  def new
    @juridico_processo = Juridico::Processo.new
    build_processo
  end

  # GET /juridico/processos/1/edit
  def edit
    build_processo
  end

  # POST /juridico/processos
  # POST /juridico/processos.json
  def create
    @juridico_processo = Juridico::Processo.new(juridico_processo_params)

    respond_to do |format|
      if @juridico_processo.save
        format.html { redirect_to @juridico_processo, notice: 'Processo was successfully created.' }
        format.json { render :show, status: :created, location: @juridico_processo }
      else
        format.html { render :new }
        format.json { render json: @juridico_processo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /juridico/processos/1
  # PATCH/PUT /juridico/processos/1.json
  def update

    respond_to do |format|
      if @juridico_processo.update(juridico_processo_params)
        format.html { redirect_to @juridico_processo, notice: 'Processo was successfully updated.' }
        format.json { render :show, status: :ok, location: @juridico_processo }
      else
        format.html { render :edit }
        format.json { render json: @juridico_processo.errors, status: :unprocessable_entity }
      end
    end

  end

  # DELETE /juridico/processos/1
  # DELETE /juridico/processos/1.json
  def destroy
    @juridico_processo.destroy
    respond_to do |format|
      format.html { redirect_to juridico_processos_url, notice: 'Processo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_juridico_processo
      @juridico_processo = Juridico::Processo.find(params[:id])
    end

    #build contact relationships
    def build_processo
      @juridico_processo.andamentos.build
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def juridico_processo_params
      params.require(:juridico_processo).permit(:number, :category, :author, :defendant, :date, :shire, :circuit, :value, :free, :notes, andamentos_attributes:[:id, :data, :nota, :_destroy])
    end
end
