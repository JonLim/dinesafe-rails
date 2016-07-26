class EstablishmentsController < ApplicationController
  before_action :set_establishment, only: [:show, :edit, :update, :destroy]

  def index
    @establishments = Establishment.page(params[:page]).per(30)
  end

  def show
    @inspections = @establishment.inspections
  end

  def upload
    puts params[:dinesafe_dump]
    uploaded_io = params[:dinesafe_dump]
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end

    uploaded_file = File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename))
    parsed_file = Oga.parse_xml(uploaded_file)

    upload_log = { file_name: uploaded_io.original_filename, establishments: 0, inspections: 0, infractions: 0 }

    parsed_file.each_node do | node |
      if node.is_a?(Oga::XML::Element) and node.name == 'ROW'
        establishment = Hash.new

        node.children.each do | child_node |
          if child_node.is_a?(Oga::XML::Element)
            establishment[child_node.name] = child_node.text
          end
        end

        if !Establishment.exists?(establishment['ESTABLISHMENT_ID'])
          p 'CREATING ESTABLISHMENT ' + establishment['ESTABLISHMENT_ID'] + ': ' + establishment['ESTABLISHMENT_NAME']

          Establishment.create(
            id: establishment['ESTABLISHMENT_ID'],
            name: establishment['ESTABLISHMENT_NAME'],
            establishment_type: establishment['ESTABLISHMENTTYPE'],
            address: establishment['ESTABLISHMENT_ADDRESS'],
            min_inspections: establishment['MINIMUM_INSPECTIONS_PERYEAR'])

          upload_log[:establishments] += 1;
        end

        if !Inspection.exists?(establishment['INSPECTION_ID'])
          p 'CREATING INSPECTION ' + establishment['INSPECTION_ID'] + ' FOR ' +  establishment['ESTABLISHMENT_ID']

          Inspection.create(
            id: establishment['INSPECTION_ID'],
            establishment_id: establishment['ESTABLISHMENT_ID'],
            date: establishment['INSPECTION_DATE'],
            status: establishment['ESTABLISHMENT_STATUS'])

          upload_log[:inspections] += 1;
        end

        if ( !establishment['INFRACTION_DETAILS'].blank? and 
          ( Inspection.exists?(establishment['INSPECTION_ID']) and 
            !Infraction.exists?(:inspection_id => establishment['INSPECTION_ID'], :details => establishment['INFRACTION_DETAILS']) ))
          p 'CREATING INFRACTION FOR ' +  establishment['INSPECTION_ID']

          Infraction.create(
            inspection_id: establishment['INSPECTION_ID'],
            details: establishment['INFRACTION_DETAILS'],
            severity: establishment['SEVERITY'],
            action: establishment['ACTION'],
            court_outcome: establishment['COURT_OUTCOME'],
            amount_fined: establishment['AMOUNT_FINED'])

          upload_log[:infractions] += 1;
        end
      end
    end

    UploadLog.create(
      date_uploaded: Time.now(),
      file_name: upload_log[:file_name],
      establishments_created: upload_log[:establishments],
      inspections_created: upload_log[:inspections],
      infractions_created: upload_log[:infractions])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_establishment
      @establishment = Establishment.find(params[:id])
    end
end
