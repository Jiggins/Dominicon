#! bin/rails runner

# Run from rails root directory as
# ./scripts/imdb-scraper.rb 2>> log/imdb-scraper.log

require 'json'
require 'open-uri'
require 'net/http'

uri = URI('http://www.omdbapi.com')

# For all games that haven't been scraped yet, get:
#   description, release date, imdbID and cover photo
Games::Console.where(imdbID: nil).each do |game|
  
  # See http://www.omdbapi.com for parameters
  request_params = {t: game.name, plot: 'full', format: 'json'}

  # GET request with above parameters
  uri.query = URI.encode_www_form(request_params)
  res = Net::HTTP.get_response uri

  # Just incase something goes wrong
  unless res.is_a?(Net::HTTPSuccess)
    STDERR.puts "#{game.name} #{res.body}"
  else
    # omdbapi responds with JSON
    response = JSON.parse res.body

    # { "Response": "Ralse" } means that the game could not be found :(
    if response['Response'] == 'False'
      STDERR.puts "#{game.name}: #{response["Error"]}"

      # Write 'N/A' to :imdbID so that it doesn't get searched again
      game.update(imdbID: 'N/A')
      next
    end

    imdbID = response['imdbID']

    begin
      released = DateTime.parse(response['Released'])
    rescue Exception => e
      released = nil
      STDERR.puts "#{game.name}: #{e.message}"
    end

    # Not all games have a plot
    unless response['Plot'] == 'N/A'
      plot = response['Plot']
    end

    # Ok, here we go!
    # response['Poster'] returns a link to ia.media-imdb.com
    # this opens a connection and saves the file to /tmp (sorry Windows users
    # (not sorry)). It then adds the image to the database!
    unless response['Poster'] == 'N/A'
      image_uri = URI(response['Poster'])

      Net::HTTP.start(image_uri.host) do |http|
        begin
          img = http.get(image_uri.path)

          # 'wb' write a binary (image) file
          file = open "/tmp/#{game.slug}.jpg", 'wb'
          file.write(img.body)

          game.update(image: file)

        rescue Exception => e
          STDERR.puts "Exception when getting image: #{e.message}"
        ensure
          file.close
        end
      end
    end

    # And... update!
    game.update(description: plot, imdbID: imdbID, released: released, url: "http://www.imdb.com/title/#{imdbID}")

    puts "Name: #{game.name}"
    puts "Plot: #{game.description}"
    puts "Released: #{game.released}"
    puts "Image File Name: #{game.image_file_name}"
  end
end

