class Artist < PM::Screen

  def artist_results(search_params)
    parsed_params = search_params.gsub(' ', '%20')
    query = "q=lil%20genre:%22#{parsed_params}%22&type=artist"

   AFMotion::JSON.get("https://api.spotify.com/v1/search?#{query}") do |result|
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

  # def album_results(search_params)
  #  AFMotion::JSON.get("https://api.spotify.com/v1/artists/0OdUWJ0sBjDrqHygGUXeCF/albums") do |result|
  #    # puts "these are the search things #{parsed_params}"
  #
  #       if result.success?
  #         puts result.object
  #         ids = []
  #           result.object["items"][0]["id"].each do |album|
  #             ids << album["id"]
  #           end
  #         names = []
  #           result.object["items"][0]["name"].each do |album|
  #             names << album["name"]
  #           end
  #           list = ids.zip(names)
  #           open_new_table_view(list)
  #       else
  #         puts " there were no results"
  #         # open HomeScreen
  #       end
  #     end
  #   end

  def open_new_table_view(list)
    @list = list
    puts "this should open the controller with #{list}"
    puts @list.class

    open SearchResultsScreen.new(info:@list)
  end

end
