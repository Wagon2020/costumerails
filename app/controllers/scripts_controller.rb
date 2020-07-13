class ScriptsController < ApplicationController

  def index
    # @scripts = Script.all
    @scripts = policy_scope(Script) # .order(created_at: :desc)
  end

  def new
    @script = Script.new
    authorize @script
  end

  def show
    @script = Script.find(params[:id])
    @scenes = Scene.where(script_id: @script).order(number: :asc)
    authorize @script
  end

  def create
    @script = Script.new(script_params)
    @script.user = current_user
    authorize @script
    if @script.save
      redirect_to scripts_path, notice: 'Script successfully created.'
    else
      redirect_to scripts_path, notice: 'Error: No information entered.'
    end
  end

  def edit
    @script = Script.find(params[:id])
  end

  def update
    @script = Script.find(params[:id])
    @script.update(script_params)

    redirect_to scripts_path
  end

  def destroy
    @script = Script.find(params[:id])
    authorize @script
    @script.destroy

    redirect_to scripts_path
  end

  private

  def script_params
    params.require(:script).permit(:name)
  end

end
