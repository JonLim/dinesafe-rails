class EstablishmentsController < ApplicationController
  before_action :set_establishment, only: [:show, :edit, :update, :destroy]

  def index
    @establishments = Establishment.page(params[:page]).per(30).includes(:inspections => :establishment)

    if params[:search]
      @establishments = Establishment.search(params[:search]).page(params[:page]).per(30).includes(:inspections => :establishment)
    end

    if (params[:sort] && params[:direction])
      @establishments.order(params[:sort] + ' ' + params[:direction])
    else
      @establishments.order(:name)
    end
  end

  def show
    @inspections = @establishment.inspections.order('date DESC').includes(:infractions => :inspection)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_establishment
      @establishment = Establishment.find(params[:id])
    end
end
