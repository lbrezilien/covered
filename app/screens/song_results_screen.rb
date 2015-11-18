class SongResultsScreen < PM::TableScreen

    title "Song Results"
    attr_accessor :info



    def table_data
          [{
            cells: @items.map do |f|

                  {
                    title: f[1],
                    action: :tap_song,
                    arguments: { song_id:f[0], song_name: f[1] }
                  }
                end
          }]
    end


  def on_load
      set_nav_bar_button :left, title: "New Search", action: :open_search_screen
       @items = @info
       update_table_data
  end

  def tap_song(args={})
    puts args
    BW::Media.play_modal("http://www.hrupin.com/wp-content/uploads/mp3/testsong_20_sec.mp3")
    # Artist.new.song_info(args[:song_id])
    PM.logger.debug args[:links]
  end

  def open_search_screen
    open HomeScreen
  end
end
