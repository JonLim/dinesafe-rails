class UploadLogsController < ApplicationController
  def index
    @uploads = UploadLog.all

    @dinesafe_stats = {}
    @dinesafe_stats[:Establishments] = Establishment.all.count
    @dinesafe_stats[:Inspections] = Inspection.all.count
    @dinesafe_stats[:Infractions] = Infraction.all.count
  end

  def show
  end
end
