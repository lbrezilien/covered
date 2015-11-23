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
    # rmq.stylesheet = ArtistResultStylesheet
    # rmq(self.view).apply_style :root_view
    #
    #
    # self.navigationItem.tap do |nav|
    #   nav.leftBarButtonItem = UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemRewind,
    #                                                                        target: self, action: :nav_left_button)
    # end


    update_table_data
    # choose_random_from_list
    # if @new_list.size > 1
    #   update_table_data
    # else
    #   @new_list << 'there are no results'
    #   update_table_data
    # end



  end

  # def nav_left_button
  #   open HomeScreen
  # end

  # def choose_random_from_list
  #   puts 'this is the result amount from spotify'
  #   puts @info.size
  #   @new_list = []
  #   5.times do
  #     random_number = rand(@info.size)
  #     puts random_number
  #     @new_list << @info[random_number]
  #   end
  #    puts @new_list
  # end


  def tap_artist(args={})
    puts "im going to albums"
    puts args
    if args[:artist_id]
      Album.new.album_results(args[:artist_id], args[:artist_name])
      PM.logger.debug args[:links]
    end
  end
end
