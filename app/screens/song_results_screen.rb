class SongResultsScreen < PM::TableScreen

  title "Song Results"

  attr_accessor :info

  def table_data
    [{
      cells: @info.map do |f|
        {
          title: f[1],
          action: :tap_song,
          arguments: { song_id:f[0], song_name: f[1], song_preview: f[2] }
        }
      end
    }]
  end

  def on_load
      set_nav_bar_button :left, title: "New Search", action: :open_search_screen
       update_table_data
  end

  def tap_song(args={})
    BW::Media.play_modal(:song_preview)
    PM.logger.debug args[:links]
  end

  def open_search_screen
    open HomeScreen
  end
end
