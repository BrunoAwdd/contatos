class Usuario::RolesController < ApplicationController
  before_action :set_usuario_role, only: [:show, :update, :edit, :destroy]
  before_action :authenticate_user!

  # GET /usuario/roles
  # GET /usuario/roles.json
  def index
    @usuario_roles = Usuario::Role.all
  end

  # GET /usuario/roles/1
  # GET /usuario/roles/1.json
  def show
  end

  # GET /usuario/roles/new
  def new
    @usuario_role = Usuario::Role.new
  end

  # GET /usuario/roles/1/edit
  def edit
  end

  # POST /usuario/roles
  # POST /usuario/roles.json
  def create
    @usuario_role = Usuario::Role.new(usuario_role_params)
    respond_to do |format|
      if @usuario_role.save
        format.html { redirect_to @usuario_role, notice: 'Role was successfully created.' }
        format.json { render :show, status: :created, location: @usuario_role }
      else
        format.html { render :new }
        format.json { render json: @usuario_role.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /usuario/roles/1
  # PATCH/PUT /usuario/roles/1.json
  def update
    respond_to do |format|
      if @usuario_role.update(usuario_role_params)
        format.html { redirect_to @usuario_role, notice: 'Role was successfully updated.' }
        format.json { render :show, status: :ok, location: @usuario_role }
      else
        format.html { render :edit }
        format.json { render json: @usuario_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuario/roles/1
  # DELETE /usuario/roles/1.json
  def destroy
    @usuario_role.destroy
    respond_to do |format|
      format.html { redirect_to usuario_roles_url, notice: 'Role was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_usuario_role
    @usuario_role = Usuario::Role.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def usuario_role_params
    params.require(:usuario_role).permit(:name)
  end
end