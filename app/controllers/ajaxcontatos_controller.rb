class AjaxcontatosController < ContatosController


  # GET /contatos/1
  # GET /contatos/1.json
  def show
  end

  # GET /contatos/new
  def new
    super
    render :layout => 'modal'
  end

  # GET /contatos/1/edit
  def edit
    super
    render :layout => 'modal'
  end

  # POST /contatos
  # POST /contatos.json
  def create
  end

  # PATCH/PUT /contatos/1
  # PATCH/PUT /contatos/1.json
  def update
  end

  # DELETE /contatos/1
  # DELETE /contatos/1.json
  def destroy
  end

end
