class SwatchesController < ApplicationController
  load_and_authorize_resource

  def index
    if current_user && current_user.admin?
      @swatches = Swatch.all
    elsif current_user
      @swatches = current_user.swatches.where(project_id: nil)
    else
      @swatches = Swatch.where(public: true)
    end
  end

  def show
    @swatch = Swatch.find(params[:id])
  end

end