class ArtistResultsScreen < PM::TableScreen

  title "Your Artists"

  attr_accessor :info

  def table_data
    @table =  [{
        cells: @info.map do |f|

          {
            title: f[1],
            action: :tap_artist,
            arguments: { artist_id:f[0], artist_name: f[1] }
          }
      end
    }]
  end

  def on_load

    self.navigationItem.tap do |nav|
      nav.leftBarButtonItem = UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemRefresh,
                                                                           target: self, action: :nav_left_button)
    end
    update_table_data

  end

  def nav_left_button
    open HomeScreen
  end

  def tap_artist(args={})
    puts "im going to albums"
    puts args
    if args[:artist_id]
      Album.new.album_results(args[:artist_id], args[:artist_name])
      PM.logger.debug args[:links]
    end
  end
end
