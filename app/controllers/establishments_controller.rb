class EstablishmentsController < ApplicationController
  before_action :set_establishment, only: [:show, :edit, :update, :destroy]

  def index
    @establishments = Establishment.page(params[:page]).per(30).includes(:inspections => :establishment)

    if params[:search]
      session[:search] = params[:search]
    end

    if (params[:sort] && params[:direction])
      session[:sort] = params[:sort]
      session[:direction] = params[:direction]
    else
      session[:sort] = 'name'
      session[:direction] = 'desc'
    end

    if session[:search].present?
      @establishments = Establishment.search(session[:search]).page(params[:page]).per(30).includes(:inspections => :establishment).order(session[:sort] + ' ' + session[:direction])
    else
      @establishments = Establishment.page(session[:page]).per(30).includes(:inspections => :establishment).order(session[:sort] + ' ' + session[:direction])
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
