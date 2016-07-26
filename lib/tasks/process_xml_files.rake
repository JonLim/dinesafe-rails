require 'oga'

desc 'Looks inside of /public/uploads and parses the XML files'
task :parse_xml_files => :environment do
  p 'Starting task'
  Dir.glob(Rails.root.join('public', 'uploads', '*.xml')) do | item |
    p 'First file: ' + item
    selected_file = File.open(item)
    p selected_file
    parsed_file = Oga.parse_xml(selected_file)
    p parsed_file

    upload_log = { file_name: selected_file, establishments: 0, inspections: 0, infractions: 0 }

    p upload_log

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

    File.delete(selected_file)
  end
end