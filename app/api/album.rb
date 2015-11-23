class Album < PM::Screen

  def album_results(search_params, artist_name)
   AFMotion::JSON.get("https://api.spotify.com/v1/artists/#{search_params}/albums") do |result|

        ids = []
        names = []
        a_name = []

      if result.success?
          result.object["items"].each do |album|
            if !names.include?(album["name"])
              ids << album["id"]
              names << album["name"]
              a_name << artist_name
            end
          end
          list = ids.zip(names, a_name)
          open_new_song_table(list)
      else
        puts "Sorry! There were no results"
        open_new_song_table(list)
      end
    end
  end

  def open_new_song_table(list)
    puts 'this is the list info'
    puts list
    @list = list
    open ProfileScreen.new(info:@list, nav_bar:true, view_to_load: 'albums')
  end
end
