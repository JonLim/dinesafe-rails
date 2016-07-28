desc 'Looks inside of /public/uploads and parses the XML files'
task :parse_xml_files => :environment do

  Dir.glob(Rails.root.join('public', 'uploads', '*.xml')) do | item |
    selected_file = File.open(item)
    parsed_file = Oga::XML::PullParser.new(selected_file)

    upload_log = { file_name: File.basename(item), establishments: 0, inspections: 0, infractions: 0 }

    establishment = Hash.new

    p 'STARTING PARSE' 

    parsed_file.parse do | node |
      parsed_file.on(:text, %w{ROWDATA ROW ESTABLISHMENT_ID}) do
        establishment['ESTABLISHMENT_ID'] = node.text
      end

      parsed_file.on(:text, %w{ROWDATA ROW ESTABLISHMENT_NAME}) do
        establishment['ESTABLISHMENT_NAME'] = node.text
      end

      parsed_file.on(:text, %w{ROWDATA ROW ESTABLISHMENTTYPE}) do
        establishment['ESTABLISHMENTTYPE'] = node.text
      end

      parsed_file.on(:text, %w{ROWDATA ROW ESTABLISHMENT_ADDRESS}) do
        establishment['ESTABLISHMENT_ADDRESS'] = node.text
      end

      parsed_file.on(:text, %w{ROWDATA ROW MINIMUM_INSPECTIONS_PERYEAR}) do
        establishment['MINIMUM_INSPECTIONS_PERYEAR'] = node.text
      end

      parsed_file.on(:text, %w{ROWDATA ROW INSPECTION_ID}) do
        establishment['INSPECTION_ID'] = node.text
      end

      parsed_file.on(:text, %w{ROWDATA ROW INSPECTION_DATE}) do
        establishment['INSPECTION_DATE'] = node.text
      end

      parsed_file.on(:text, %w{ROWDATA ROW ESTABLISHMENT_STATUS}) do
        establishment['ESTABLISHMENT_STATUS'] = node.text
      end

      parsed_file.on(:text, %w{ROWDATA ROW INFRACTION_DETAILS}) do
        establishment['INFRACTION_DETAILS'] = node.text
      end

      parsed_file.on(:text, %w{ROWDATA ROW SEVERITY}) do
        establishment['SEVERITY'] = node.text
      end

      parsed_file.on(:text, %w{ROWDATA ROW ACTION}) do
        establishment['ACTION'] = node.text
      end

      parsed_file.on(:text, %w{ROWDATA ROW COURT_OUTCOME}) do
        establishment['COURT_OUTCOME'] = node.text
      end

      parsed_file.on(:text, %w{ROWDATA ROW AMOUNT_FINED}) do
        establishment['AMOUNT_FINED'] = node.text
      end

      parsed_file.on(:element) do
        if node.name == 'ROW'
          if establishment.present?
            p 'Checking for new data... ESTABLISHMENT_ID: ' + establishment['ESTABLISHMENT_ID']

            if !Establishment.exists?(establishment['ESTABLISHMENT_ID'])
              p 'CREATING ESTABLISHMENT ' + establishment['ESTABLISHMENT_ID'] + ': ' + establishment['ESTABLISHMENT_NAME']

              Establishment.create(
                id: establishment['ESTABLISHMENT_ID'],
                name: establishment['ESTABLISHMENT_NAME'],
                establishment_type: establishment['ESTABLISHMENTTYPE'],
                address: establishment['ESTABLISHMENT_ADDRESS'],
                min_inspections: establishment['MINIMUM_INSPECTIONS_PERYEAR'])

              upload_log[:establishments] += 1;
            end # Establishment Creation

            if !Inspection.exists?(establishment['INSPECTION_ID'])
              p 'CREATING INSPECTION ' + establishment['INSPECTION_ID'] + ' FOR ' +  establishment['ESTABLISHMENT_ID']

              Inspection.create(
                id: establishment['INSPECTION_ID'],
                establishment_id: establishment['ESTABLISHMENT_ID'],
                date: establishment['INSPECTION_DATE'],
                status: establishment['ESTABLISHMENT_STATUS'])

              upload_log[:inspections] += 1;
            end # Inspection Creation

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
            end # Infraction Creation

            establishment = Hash.new

          end # establishment.present?
        end # node.name == 'ROW'
      end # parsed_file.on(:element) do
    end #parsed_file.parse do | node |

    UploadLog.create(
      date_uploaded: Time.now(),
      file_name: upload_log[:file_name],
      establishments_created: upload_log[:establishments],
      inspections_created: upload_log[:inspections],
      infractions_created: upload_log[:infractions])
    
    File.delete(selected_file)
  end # Dir.glob(Rails.root.join('public', 'uploads', '*.xml')) do | item |
end # task :parse_xml_files => :environment do