desc 'Checks upload folder for zip files that need to be extracted'
task :extract_zip_files => :environment do
  require 'zip'

  puts 'CHECKING FOR FILES TO UNZIP'

  Dir.glob(Rails.root.join('public', 'uploads', '*.zip')) do | item |
    Zip::File.open(item) do | zip_file |
      zip_file.each do | file |
        file_name = File.basename(item).split('.')
        file_path = File.join(Rails.root.join('public', 'uploads', file_name[0] + '.xml'))
        file.extract(file_path)
      end
    end

    File.delete(item)
  end

  Rake::Task["parse_xml_files"].invoke
end