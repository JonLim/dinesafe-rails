class UploadLogsController < ApplicationController
  def index
    @uploads = UploadLog.all
  end

  def show
  end
end
