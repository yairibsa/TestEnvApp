class GuidesController < ApplicationController
  before_action :set_guide, only: %i[ show edit update destroy toggle_status ]
  layout "guide"

  # GET /guides or /guides.json
  def index
   # byebug
    @guides = Guide.special_guides
    @page_title = "My App Guide"
  end

  # GET /guides/1 or /guides/1.json
  def show
    @page_title = @guide.title
  end

  # GET /guides/new
  def new
    @guide = Guide.new
  end

  # GET /guides/1/edit
  def edit
  end

  # POST /guides or /guides.json
  def create
    @guide = Guide.new(guide_params)

    respond_to do |format|
      if @guide.save
        format.html { redirect_to guide_url(@guide), notice: "Guide was successfully created." }
        format.json { render :show, status: :created, location: @guide }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @guide.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /guides/1 or /guides/1.json
  def update
    respond_to do |format|
      if @guide.update(guide_params)
        format.html { redirect_to guide_url(@guide), notice: "Guide was successfully updated." }
        format.json { render :show, status: :ok, location: @guide }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @guide.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guides/1 or /guides/1.json
  def destroy
    @guide.destroy

    respond_to do |format|
      format.html { redirect_to guides_url, notice: "Guide was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  
  def toggle_status
    if@guide.draft?
    @guide.published! 
    elsif @guide.published?
     @guide.draft!
    end
    redirect_to guides_url, notice: "Guide status has been updated."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guide
      @guide = Guide.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def guide_params
      params.require(:guide).permit(:title)
    end
end
