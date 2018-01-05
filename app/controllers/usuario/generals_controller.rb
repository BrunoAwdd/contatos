class Usuario::GeneralsController < ApplicationController
  before_action :set_usuario_general, only: [:show, :update, :destroy]
  before_action :authenticate_user!

  # GET /usuario/generals/1
  # GET /usuario/generals/1.json
  def show
  end

  def index
    @usuario_generals = Usuario::General.all
  end

  def new
    @usuario_general = Usuario::General.where(user_id: current_user.id).first
    if (@usuario_general.blank?)
      @usuario_general = Usuario::General.new
    else
      redirect_to edit_usuario_general_path(@usuario_general)
    end
  end



  # GET /usuario/generals/1/edit
  def edit
    @usuario_general = Usuario::General.where(user_id: current_user.id).first
    if (@usuario_general.blank?)
      redirect_to new_usuario_general_path
    end

  end

  # POST /usuario/generals
  # POST /usuario/generals.json
  def create
    @usuario_general = Usuario::General.new(usuario_general_params)
    @usuario_general.user = current_user

    respond_to do |format|
      if @usuario_general.save
        format.html { redirect_to @usuario_general, notice: 'General was successfully created.' }
        format.json { render :show, status: :created, location: @usuario_general }
      else
        format.html { render :new }
        format.json { render json: @usuario_general.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /usuario/generals/1
  # PATCH/PUT /usuario/generals/1.json
  def update
    @usuario_general.user = current_user
    respond_to do |format|
      if @usuario_general.update(usuario_general_params)
        format.html { redirect_to @usuario_general, notice: 'General was successfully updated.' }
        format.json { render :show, status: :ok, location: @usuario_general }
      else
        format.html { render :edit }
        format.json { render json: @usuario_general.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuario/generals/1
  # DELETE /usuario/generals/1.json
  def destroy
    @usuario_general.destroy
    respond_to do |format|
      format.html { redirect_to usuario_generals_url, notice: 'General was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario_general
      @usuario_general = Usuario::General.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usuario_general_params
      params.require(:usuario_general).permit(:name, :last_name, :usuario_roles_id)
    end
end
