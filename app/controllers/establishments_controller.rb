class EstablishmentsController < ApplicationController
  before_action :set_establishment, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search]
      @establishments = Establishment.search(params[:search]).order(:name).page(params[:page]).per(30).includes(:inspections => :establishment)
    elsif params[:sort] && params[:direction]
      @establishments = Establishment.order(params[:sort] + ' ' + params[:direction]).page(params[:page]).per(30).includes(:inspections => :establishment)
    else
      @establishments = Establishment.order(:name).page(params[:page]).per(30).includes(:inspections => :establishment)
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
