class ArtistResultsScreen < PM::TableScreen

    title "Search Results"

    attr_accessor :info

    def table_data
          [{
            cells: @items.map do |f|

                  {
                    title: f[1],
                    action: :tap_artist,
                    arguments: { artist_id:f[0], artist_name: f[1] }
                  }
                end
          }]
    end


  def on_load
       @items = @info
       update_table_data
  end

  def tap_artist(args={})
    puts args
    if args[:artist_id]
      Artist.new.album_results(args[:artist_id])
      PM.logger.debug args[:links]
    end
  end

  # def tap_album(args={})
  #   puts args
  #   Artist.new.song_results(args[:album_id])
  #   PM.logger.debug args[:links]
  #   end
end
