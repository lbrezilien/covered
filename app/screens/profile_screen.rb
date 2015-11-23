class ProfileScreen < PM::Screen
  attr_accessor :artists, :info, :view_to_load


    title "Profile"


    def on_load
        @artist_name = @info[0][3] || @info[0][2]



        @layout = ProfileLayout.new(root: self.view)
        @view_to_load == 'albums' ? @layout.artist_name = @info[0][2] : @layout.artist_name = @info[0][3]
        @layout.movies_view = movies_screen.view
        @layout.build

        self.navigationItem.tap do |nav|
          nav.leftBarButtonItem = UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemDone,
                                                                               target: self, action: :nav_left_button)
        end

        rmq.stylesheet = ProfileStylesheet
        rmq.stylesheet.name = @artist_name
        rmq(self.view).apply_style :root_view
        @label = rmq.append(UILabel, :name_label)

    end

    def nav_left_button
      open HomeScreen
    end

end

  def movies_screen
    if @view_to_load == 'albums'
          @movies_screen ||= begin
          m = AlbumResultsScreen.new(list:@info )
          self.addChildViewController m
          m.parent_screen = self
          m
          end
    else
          @movies_screen ||= begin
          m = SongResultsScreen.new(info:@info )
          self.addChildViewController m
          m.parent_screen = self
          m
          end
    end

end
