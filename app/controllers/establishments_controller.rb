class EstablishmentsController < ApplicationController
  before_action :set_establishment, only: [:show, :edit, :update, :destroy]

  def index
    @establishments = Establishment.order(:name).page(params[:page]).per(30)

    if params[:search]
      @establishments = Establishment.search(params[:search]).order(:name).page(params[:page]).per(30)
    else
      @establishments = Establishment.order(:name).page(params[:page]).per(30)
    end

    if params[:sort] && params[:direction]
      @establishments = Establishment.joins(:inspections).order(params[:sort] + ' ' + params[:direction]).page(params[:page]).per(30)
    end
  end

  def show
    @inspections = @establishment.inspections.order('date DESC')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_establishment
      @establishment = Establishment.find(params[:id])
    end
end
