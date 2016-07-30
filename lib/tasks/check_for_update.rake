desc 'Pings DineSafe data file and checks for modified date'
task :check_for_update => :environment do
  require 'net/http'
  require 'open-uri'

  puts 'CHECKING DINESAFE DATA FOR LAST MODIFIED DATE'

  uri = URI.parse('http://opendata.toronto.ca/public.health/dinesafe/dinesafe.zip')
  req = Net::HTTP::Head.new(uri.path)

  res = Net::HTTP.start(uri.host, uri.port) do | http |
    http.request(req)
  end

  if res['Last-Modified'] > UploadLog.all.order('date_uploaded DESC').first.date_uploaded
    puts 'NEWER FILE FOUND, DOWNLOADING'
    currDate = Time.now()
    formattedDate = currDate.strftime("%Y%b%d")

    download = open('http://opendata.toronto.ca/public.health/dinesafe/dinesafe.zip')
    IO.copy_stream(download, Rails.root.join('public', 'uploads', "dinesafe_#{formattedDate}.zip"))

    Rake::Task["extract_zip_files"].invoke
  else
    puts 'LAST MODIFIED: ' + res['Last-Modified']
    puts 'NOT NEW ENOUGH'
  end
end