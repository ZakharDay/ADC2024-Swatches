class FillsController < ApplicationController
  load_and_authorize_resource
  before_action :get_all_fills, only: %i[ solid gradient ]

  def index
    if current_user && current_user.admin?
      @fills = Fill.all
    elsif current_user
      @fills = current_user.fills
    end
  end

  def solid
    @fills = []

    @fills_all.each do |fill|
      if fill.colors.count == 1
        @fills << fill
      end
    end
  end

  def gradient
    @fills = []

    @fills_all.each do |fill|
      if fill.colors.count > 1
        @fills << fill
      end
    end
  end

  def show
    @fill = Fill.find(params[:id])
  end

  private

  def get_all_fills
    if current_user && current_user.admin?
      @fills_all = Fill.all
    elsif current_user
      @fills_all = current_user.fills
    end
  end

end