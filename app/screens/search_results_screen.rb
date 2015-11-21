class SearchResultsScreen < PM::TableScreen

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

  def go_to_search
    open HomeScreen
  end

  def on_load
      set_nav_bar_button :left, title: "New Search", action: :go_to_search

       @items = @info
       update_table_data
  end

  def tap_artist(args={})
    puts args
    Artist.new.album_results(args[:artist_id])
    PM.logger.debug args[:links]
  end
end







    # searchable placeholder: "Filter Results"
    #
    # # def will_appear
    # #   set_attributes(self.view, {background_color: hex_color("#FFFFFF")})
    # # end
    # #
    # # def table_data
    # #   [{
    # #     cells: [
    # #       {title: "Thug's Mansion Cover", action: :open_video_view},
    # #       {title: "Piano Man Cover", action: :open_video_view},
    # #       {title: "Hotel California Cover", action: :open_video_view},
    # #       {title: "Suit and Tie Cover", action: :open_video_view}
    # #     ]
    # #
    # #     }]
    # #
    # # end
    # #
    # # def open_video_view
    # #   open VideoScreen
    # # end


# end
