class ScenesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new, :create]


  def index
    @scene = policy_scope(Scene) # .order(created_at: :desc)
  end

  def new
    @script = Script.find(params[:script_id])
    @scene = Scene.new
    skip_authorization
    # authorize @scene
  end

  def create
    @script = Script.find(params[:script_id])
    @scene = Scene.new(scene_params)
    @scene.script = @script
    skip_authorization
    # authorize @scene
    if @scene.save
      redirect_to script_path(@script), notice: 'Scene successfully created.'
    else
      redirect_to script_path(@script), notice: 'Error: No information entered.'
    end
  end

  def show
    @scene = Scene.find(params[:id])
    @script = Script.find(@scene.script_id)
    @roles = SceneRole.where(scene_id: @scene)
    skip_authorization
    # authorize @script
  end

  def edit
    @scene = Scene.find(params[:id])
    @script = @scene.script
    authorize @scene
  end

  def update
    @scene = Scene.find(params[:id])
    @script = @scene.script
    @scene.update(scene_params)
    authorize @scene

    redirect_to script_path(@script)
  end

  def destroy
    @scene = Scene.find(params[:id])
    @script = Script.find(@scene.script_id)
    # authorize @scene
    skip_authorization
    @scene.destroy

    redirect_to script_path(@script)
  end

  private

  def scene_params
    params.require(:scene).permit(:number, :name, :description, :body, :mood, :place, :notes)
  end
end
