class SongResultsScreen < PM::TableScreen

    title "Search Results"

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
       @items = @info
       update_table_data
  end

  def tap_song(args={})
    puts args
    Artist.new.song_info(args[:song_id])
    PM.logger.debug args[:links]
  end
end
