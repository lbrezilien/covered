class Artist < PM::Screen

  def artist_results(search_params)
    parsed_params = search_params.gsub(' ', '%20')
    query = "#{parsed_params}"


   AFMotion::JSON.get("https://api.spotify.com/v1/search?q=%20genre:%22#{query}%22&type=artist") do |result|

        if result.success?
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
            open_new_song_table(list)
        else
          puts " there were no results"
          open_new_song_table(list)
        end
      end
    end

  def song_results(search_params)
   AFMotion::JSON.get("https://api.spotify.com/v1/albums//#{search_params}/tracks?offset=0") do |result|
     # puts "these are the search things #{parsed_params}"

        if result.success?
          # puts result.object
          ids = []
            result.object["items"].each do |song|
              ids << song["id"]
            end
          names = []
            result.object["items"].each do |song|
              names << song["name"]
            end
            list = ids.zip(names)
            puts list
          # puts "this is the  of items #{list}"
            open_song_info(list)
        else
          puts " there were no results"
          open_song_info(list)
          # open HomeScreen
        end
      end
    end

  def song_info(search_params)
   AFMotion::JSON.get("https://api.spotify.com/v1/tracks/#{search_params}") do |result|
     # puts "these are the search things #{parsed_params}"

        if result.success?
          ids = []
            id = result.object["id"]
            name = result.object["name"]
            list = [id,name]
            view_song(list)
        end
      end
    end

  def open_new_table_view(list)
    puts list
    @list = list
    open ArtistResultsScreen.new(info:@list)
  end

  def open_new_song_table(list)
    @list = list
    open AlbumResultsScreen.new(info:@list)
    puts @list
  end


  def open_song_info(list)
    @list = list
    open SongResultsScreen.new(info:@list)
    puts @list

#     open SearchResultsScreen.new(nav_bar: true, info:@list)
# >>>>>>> a3fb3b107367980e93d1bdc7bf763bba4fafb6af
  end

  def view_song(list)
    @list = list
    open SongScreen.new(info:@list)
    puts @list
  end

end

