class Artist < PM::Screen

  def artist_results(search_params)
    parsed_params = search_params.gsub(' ', '%20')
    query = "#{parsed_params}"


   AFMotion::JSON.get("https://api.spotify.com/v1/search?q=%20genre:%22#{query}%22&type=artist") do |result|
     puts "these are the search things #{parsed_params}"

        if result.success?
          puts result.object
          ids = []
            result.object["artists"]["items"].each do |artist|
              ids << artist["id"]
            end
          names = []
            result.object["artists"]["items"].each do |artist|
              names << artist["name"]
            end
            list = ids.zip(names)
            puts list.class
            open_new_table_view(list)
        else
          puts " there were no results"
          # open HomeScreen
        end
      end
    end

  def album_results(search_params)
   AFMotion::JSON.get("https://api.spotify.com/v1/artists/#{search_params}/albums") do |result|
     # puts "these are the search things #{parsed_params}"

        if result.success?
          # puts result.object
          ids = []
            result.object["items"].each do |album|
              ids << album["id"]
            end
          names = []
            result.object["items"].each do |album|
              names << album["name"]
            end
            list = ids.zip(names)
          # puts "this is the  of items #{list}"
            open_new_table_view(list)
        else
          puts " there were no results"
          # open HomeScreen
        end
      end
    end

  def open_new_table_view(list)
    puts list
    @list = list
    puts "I have reached the table opener"

    open SearchResultsScreen.new(info:@list)
  end

  # def open_new_table(list)
  #   puts "I have reached the new table opener"
  #   puts list
  #   @list = list
  #
  #   open SearchResultsScreen.new(info:@list)
  # end

end
