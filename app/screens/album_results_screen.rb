class AlbumResultsScreen < PM::TableScreen

    title "Album Results"

    attr_accessor :list

    def on_load
      set_nav_bar_button :left, title: "New Search"
    end

    def table_data
          [{
            cells: @items.map do |f|

                  {
                    title: f[1],
                    action: :tap_album,
                    arguments: { album_id:f[0], album_name: f[1] }
                  }
                end
          }]
    end


  def on_load
       set_nav_bar_button :left, title: "New Search", action: :open_search_screen
       @items = @list
       update_table_data
  end

  def tap_album(args={})
    puts "im going to songs"
    puts args
    Artist.new.song_results(args[:album_id])
    PM.logger.debug args[:links]
  end

  def open_search_screen
    open HomeScreen
  end
end
