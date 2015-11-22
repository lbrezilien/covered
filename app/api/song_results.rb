class SongResults < PM::Screen

  def song_results(search_params)

  ids = []
  names = []
  previews = []

  AFMotion::JSON.get("https://api.spotify.com/v1/albums//#{search_params}/tracks?offset=0") do |result|
      if result.success?
          result.object["items"].each do |song|
            ids << song["id"]
            names << song["name"]
            previews << song["preview_url"]
          end
          list = ids.zip(names,previews)
          open_song_info(list)
      else
        puts "Sorry! There were no results"
        open_song_info(list)
      end
    end
  end

  def open_song_info(list)
    @list = list
    open ProfileScreen.new(info:@list, nav_bar:true, view_to_load:'songs')
  end
end
