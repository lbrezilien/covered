class Album < PM::Screen 

  def album_results(search_params, pic_id)
   AFMotion::JSON.get("https://api.spotify.com/v1/artists/#{search_params}/albums") do |result|

        ids = []
        names = []
        pics = []
    
      if result.success?
          result.object["items"].each do |album|
            if !names.include?(album["name"])
              ids << album["id"]
              names << album["name"]
              pics << pic_id
            end
          end
          list = ids.zip(names, pics)
          open_new_song_table(list)
      else
        puts "Sorry! There were no results"
        open_new_song_table(list)
      end
    end
  end

  def open_new_song_table(list)
    @list = list
    open ProfileScreen.new(albums:@list, nav_bar:true)
  end
end