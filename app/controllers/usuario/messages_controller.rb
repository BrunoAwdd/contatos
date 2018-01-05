class Usuario::MessagesController < ApplicationController
  before_action :set_usuario_message, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /usuario/messages
  # GET /usuario/messages.json
  def index
    @usuario_messages = Usuario::Message.where(to_id: current_user.id)
    @from_messages = Usuario::Message.where(from_id: current_user.id)
    @all_messages = Usuario::Message.where(to_id: nil)
  end

  # GET /usuario/messages/1
  # GET /usuario/messages/1.json
  def show
    if (!@usuario_message.interessado?(current_user))
        redirect_to usuario_messages_path
    else
      if (@usuario_message.visualized != 1)
        @usuario_message.visualized = 1
        @usuario_message.save
      end
    end

  end

  # GET /usuario/messages/new
  def new
    @usuario_message = Usuario::Message.new
  end

  # GET /usuario/messages/1/edit
  def edit
  end

  # POST /usuario/messages
  # POST /usuario/messages.json
  def create
    @usuario_message = Usuario::Message.new(usuario_message_params)
    @usuario_message.from = current_user
    respond_to do |format|
      if @usuario_message.save
        format.html { redirect_to @usuario_message, notice: 'Message was successfully created.' }
        format.json { render :show, status: :created, location: @usuario_message }
      else
        format.html { render :new }
        format.json { render json: @usuario_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usuario/messages/1
  # PATCH/PUT /usuario/messages/1.json
  def update
    respond_to do |format|
      if @usuario_message.update(usuario_message_params)
        format.html { redirect_to @usuario_message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @usuario_message }
      else
        format.html { render :edit }
        format.json { render json: @usuario_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuario/messages/1
  # DELETE /usuario/messages/1.json
  def destroy
    if (@usuario_message.from == current_user.id || @usuario_message.to == nil)
      @usuario_message.destroy
      respond_to do |format|
        format.html { redirect_to usuario_messages_url, notice: 'Message was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to usuario_messages_url, notice: 'Message not destroyed' }
        format.json { head :no_content }
      end
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario_message
      @usuario_message = Usuario::Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usuario_message_params
      params.require(:usuario_message).permit(:message, :status, :to_id, :subject )
    end
end
