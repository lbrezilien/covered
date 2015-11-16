class Artist < PM::Screen

  def results(search_params)
    parsed_params = search_params.gsub(' ', '%20')
    query = "q=lil%20genre:%22#{parsed_params}%22&type=artist"

   AFMotion::JSON.get("https://api.spotify.com/v1/search?#{query}") do |result|
     puts "these are the search things #{parsed_params}"

        if result.success?
          puts result.object
            list = result.object["artists"]["items"].first["genres"].map{
                        |v| v
            }
            open_new_table_view(list)
        else
          puts " there were no results"
          # open HomeScreen
        end
      end
    end

  def open_new_table_view(list)
    @list = list
    puts "this should open the controller with #{list}"
    open SearchResultsScreen.new(info:@list)
  end

end
