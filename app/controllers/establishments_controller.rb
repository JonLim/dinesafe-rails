class EstablishmentsController < ApplicationController
  before_action :set_establishment, only: [:show, :edit, :update, :destroy]

  def index
    
    
    if params[:search]
      @establishments = Establishment.joins("inner join inspections on establishments.id = inspections.establishment_id AND inspections.id = (select id from inspections where establishment_id = establishments.id order by date desc limit 1)").search(params[:search]).order(:name).page(params[:page]).per(30)
    elsif params[:sort] && params[:direction]
      @establishments = Establishment.joins("inner join inspections on establishments.id = inspections.establishment_id AND inspections.id = (select id from inspections where establishment_id = establishments.id order by date desc limit 1)").order(params[:sort] + ' ' + params[:direction]).page(params[:page]).per(30)
    else
      @establishments = Establishment.joins("inner join inspections on establishments.id = inspections.establishment_id AND inspections.id = (select id from inspections where establishment_id = establishments.id order by date desc limit 1)").order(:name).page(params[:page]).per(30)
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
