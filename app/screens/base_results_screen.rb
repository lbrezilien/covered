class BaseResultScreen < PM::Screen

  title "Artist Recommendations"

  attr_accessor :artists, :info, :reload
    def on_load
        @layout = BaseResultLayout.new(root: self.view)
        @layout.movies_view = list_screen.view
        @layout.build

        self.navigationItem.tap do |nav|
          nav.leftBarButtonItem = UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemDone,
                                                                               target: self, action: :nav_left_button)
        end

        rmq.stylesheet = ResultStylesheet

        rmq(self.view).apply_style :root_view
        rmq.append(UILabel, :result_label)

        rmq.append(UIButton, :try_again).on(:touch) do
              search_api(@reload)
        end


        def search_api(search_term)
            Artist.new.artist_results(search_term)
        end
    end

    def nav_left_button
      open HomeScreen
    end


end

def list_screen

        choose_random_from_list
        puts @new_list
        @movies_screen ||= begin
        m = ArtistResultsScreen.new(info:@new_list )
        self.addChildViewController m
        m.parent_screen = self
        m
        end
end

def choose_random_from_list
  @new_list = []
  5.times do
    random_number = rand(@info.size)
    @new_list << @info[random_number]
  end
end
