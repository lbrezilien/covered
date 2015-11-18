class AlbumResultsScreen < PM::TableScreen

    title "Search Results"

    attr_accessor :info

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
       @items = @info
       update_table_data
  end

  def tap_album(args={})
    puts args
    Artist.new.song_results(args[:album_id])
    PM.logger.debug args[:links]
  end
end
