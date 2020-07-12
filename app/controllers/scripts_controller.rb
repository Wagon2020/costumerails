class ScriptsController < ApplicationController

  def index
    @scripts = Script.all
  end

  def new
    @script = Script.new
  end

  def show
    @script = Script.find(params[:id])
  end

  def create
    @script = Script.new(script_params)
    @script.user = current_user
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
    @script.destroy

    redirect_to scripts_path
  end

  private

  def script_params
    params.require(:script).permit(:name)
  end

end
