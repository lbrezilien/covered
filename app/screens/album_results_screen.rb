class AlbumResultsScreen < PM::TableScreen

  title "Album Results"

  attr_accessor :list

  def on_load
    @items = @list
    update_table_data
  end

  def table_data
    [{
      cells: @items.map do |f|
        {
          title: f[1],
          action: :tap_album,
          arguments: { album_id:f[0], album_name: f[1], artist_name: f[2] }
        }
      end
    }]
  end

  def tap_album(args={})
    puts 'im goign to the songs in this album'
    puts args
    SongResults.new.song_results(args[:album_id], args[:artist_name])
    PM.logger.debug args[:links]
  end

end
