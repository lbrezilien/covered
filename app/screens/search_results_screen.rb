class SearchResultsScreen < PM::TableScreen

    title "Search Results"
    searchable
    attr_accessor :info

    def table_data
          [{
            cells: @items.map do |f|
                  {
                    title: f,
                    action: :tap_artist,
                    arguments: { links: "#{f} by lesly" }
                  }
                end
          }]
    end

  def on_load
       @items = @info
       update_table_data
  end

  def tap_artist(args={})
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
