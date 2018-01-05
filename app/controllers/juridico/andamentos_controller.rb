class Juridico::AndamentosController < ApplicationController
  before_action :set_juridico_andamento, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /juridico/andamentos
  # GET /juridico/andamentos.json
  def index
    @juridico_andamentos = Juridico::Andamento.all
  end

  # GET /juridico/andamentos/1
  # GET /juridico/andamentos/1.json
  def show
  end

  # GET /juridico/andamentos/new
  def new
    @juridico_andamento = Juridico::Andamento.new
  end

  # GET /juridico/andamentos/1/edit
  def edit
  end

  # POST /juridico/andamentos
  # POST /juridico/andamentos.json
  def create
    @juridico_andamento = Juridico::Andamento.new(juridico_andamento_params)

    respond_to do |format|
      if @juridico_andamento.save
        format.html { redirect_to @juridico_andamento, notice: 'Andamento was successfully created.' }
        format.json { render :show, status: :created, location: @juridico_andamento }
      else
        format.html { render :new }
        format.json { render json: @juridico_andamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /juridico/andamentos/1
  # PATCH/PUT /juridico/andamentos/1.json
  def update
    respond_to do |format|
      if @juridico_andamento.update(juridico_andamento_params)
        format.html { redirect_to @juridico_andamento, notice: 'Andamento was successfully updated.' }
        format.json { render :show, status: :ok, location: @juridico_andamento }
      else
        format.html { render :edit }
        format.json { render json: @juridico_andamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /juridico/andamentos/1
  # DELETE /juridico/andamentos/1.json
  def destroy
    @juridico_andamento.destroy
    respond_to do |format|
      format.html { redirect_to juridico_andamentos_url, notice: 'Andamento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_juridico_andamento
      @juridico_andamento = Juridico::Andamento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def juridico_andamento_params
      params.require(:juridico_andamento).permit(:nota, :data, :processo_id)
    end
end
