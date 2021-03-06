class WidgetsController < ApplicationController
  before_action :set_widget, only: [:show, :edit, :update, :destroy]
  before_action :require_user
  # GET /widgets
  # GET /widgets.json
  def index
    @widgets = Widget.paginate(page: params[:page], per_page: 5)
  end
  
  # GET /widgets/1
  # GET /widgets/1.json
  def show
  end

  # GET /widgets/new
  def new
    @widget = Widget.new
  end

  # GET /widgets/1/edit
  def edit
  end
  
  # POST /widgets
  # POST /widgets.json
  def create
    @widget = Widget.new(widget_params)
    @widget.user = User.first
    respond_to do |format|
      if @widget.save
        format.html { redirect_to @widget, success: 'Ad was successfully created.' }
        #flash[:success] = "Post successfully created"
        format.json { render :show, status: :created, location: @widget }
      else
        format.html { render :new }
        format.json { render json: @widget.errors, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /widgets/1
  # PATCH/PUT /widgets/1.json
  def update
    respond_to do |format|
      if @widget.update(widget_params)
        format.html { redirect_to @widget, success: 'Widget was successfully updated.' }
        format.json { render :show, status: :ok, location: @widget }
      else
        format.html { render :edit }
        format.json { render json: @widget.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /widgets/1
  # DELETE /widgets/1.json
  def destroy
    @widget.destroy
      format.html { redirect_to @widget, danger: 'User was successfully destroyed.' }
      format.json { head :no_content }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_widget
      @widget = Widget.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def widget_params
      params.require(:widget).permit(:body, :headline, :caption, :description)
    end
end