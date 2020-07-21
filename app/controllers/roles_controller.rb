class RolesController < ApplicationController
  def index
    @script = Script.find(params[:script_id])
    @roles = policy_scope(@script.roles)
  end

  def new
    @script = Script.find(params[:script_id])
    @role = Role.new
    authorize @role
  end

  def create
    @script = Script.find(params[:script_id])
    @role = Role.new(role_params)
    @role.script = @script
    authorize @role
    if @role.save
      redirect_to script_path(@script), notice: 'Role successfully created.'
    else
      redirect_to script_path(@script), notice: 'Error: No information entered.'
    end
  end

  private

  def role_params
    params.require(:role).permit(:number, :name, :notes)
  end

end
