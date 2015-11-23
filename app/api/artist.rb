class Artist < PM::Screen

  def artist_results(search_params)
    parsed_params = search_params.gsub(' ', '%20')
    query = "#{parsed_params}"

    ids = []
    names = []

   AFMotion::JSON.get("https://api.spotify.com/v1/search?q=%20genre:%22#{query}%22&type=artist") do |result|
      if result.success?
          result.object["artists"]["items"].each do |artist|
            ids << artist["id"]
            names << artist["name"]
          end
          list = ids.zip(names)
          puts list.class
          open_new_table_view(search_params,list)
      else
        puts "Sorry! There were no results"
      end
    end
  end

  def open_new_table_view(params,list)
    puts list
    @list = list
    open BaseResultScreen.new(reload:params, info:@list, nav_bar:true)

    # open ArtistResultsScreen.new(info:@list, nav_bar:true)
  end
end
