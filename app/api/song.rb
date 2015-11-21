class Song < PM::Screen  

  def song_info(search_params)

  AFMotion::JSON.get("https://api.spotify.com/v1/tracks/#{search_params}") do |result|
      if result.success?
          id = result.object["id"]
          name = result.object["name"]
          list = [id,name]
          view_song(list)
      end
    end
  end
  
  def view_song(list)
    @list = list
    open SongScreen.new(info:@list, nav_bar:true)
  end
end