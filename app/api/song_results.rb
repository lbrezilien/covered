class SongResults < PM::Screen

  def song_results(search_params, artist_name)

  ids = []
  names = []
  previews = []
  a_name = []


  AFMotion::JSON.get("https://api.spotify.com/v1/albums//#{search_params}/tracks?offset=0") do |result|
      if result.success?
          result.object["items"].each do |song|
            ids << song["id"]
            names << song["name"]
            previews << song["preview_url"]
            a_name << artist_name
          end
          list = ids.zip(names,previews, a_name)
          open_song_info(list)
      else
        puts "Sorry! There were no results"
        open_song_info(list)
      end
    end
  end

  def open_song_info(list)
    puts list
    @list = list
    open ProfileScreen.new(info:@list, nav_bar:true, view_to_load:'songs')
  end
end
