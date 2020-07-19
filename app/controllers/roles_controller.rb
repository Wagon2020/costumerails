class RolesController < ApplicationController
  def index
    @script = Script.find(params[:script_id])
    @roles = policy_scope(@script.roles)
  end
end
