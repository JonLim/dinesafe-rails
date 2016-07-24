class EstablishmentsController < ApplicationController
  def index
    @establishments = Establishment.all
  end

  def show
  end
end
