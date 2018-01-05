class Business::NotesController < ApplicationController
  before_action :set_business_note, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /business/notes
  # GET /business/notes.json
  def index
    @business_notes = Business::Note.all
  end

  # GET /business/notes/1
  # GET /business/notes/1.json
  def show
  end

  # GET /business/notes/new
  def new
    @business_note = Business::Note.new
  end

  # GET /business/notes/1/edit
  def edit
  end

  # POST /business/notes
  # POST /business/notes.json
  def create
    @business_note = Business::Note.new(business_note_params)

    respond_to do |format|
      if @business_note.save
        format.html { redirect_to @business_note, notice: 'Note was successfully created.' }
        format.json { render :show, status: :created, location: @business_note }
      else
        format.html { render :new }
        format.json { render json: @business_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /business/notes/1
  # PATCH/PUT /business/notes/1.json
  def update
    respond_to do |format|
      if @business_note.update(business_note_params)
        format.html { redirect_to @business_note, notice: 'Note was successfully updated.' }
        format.json { render :show, status: :ok, location: @business_note }
      else
        format.html { render :edit }
        format.json { render json: @business_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /business/notes/1
  # DELETE /business/notes/1.json
  def destroy
    @business_note.destroy
    respond_to do |format|
      format.html { redirect_to business_notes_url, notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business_note
      @business_note = Business::Note.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def business_note_params
      params.require(:business_note).permit(:note, :business_general_id)
    end
end
