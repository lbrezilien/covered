class HomeScreen < PM::Screen

  def viewDidLoad
    super

    # Sets a top of 0 to be below the navigation control, it's best not to do this
    # self.edgesForExtendedLayout = UIRectEdgeNone

    rmq.stylesheet = HomeStylesheet
    init_nav

    rmq(self.view).apply_style :root_view

    # Create your UIViews here
    @search = rmq.append(UITextField, :manual_search).validates(:presence).focus.get

    rmq.append(UIButton, :submit_button).on(:touch) do
      search_api(@search.text)
    end

    rmq.append(UIButton, :pop_genre).on(:touch) do
      search_api('pop')
    end

    rmq.append(UIButton, :rock_genre).on(:touch) do
      search_api('rock')
    end

    rmq.append(UIButton, :rap_genre).on(:touch) do
      search_api('rap')
    end

    rmq.append(UIButton, :jazz_genre).on(:touch) do
      search_api('jazz')
    end

    rmq.append(UIButton, :house_genre).on(:touch) do
      search_api('house')
    end

    rmq.append(UIButton, :blues_genre).on(:touch) do
      search_api('blues')
    end

    rmq.append(UIButton, :electronic_genre).on(:touch) do
      search_api('electronic')
    end

    rmq.append(UIButton, :country_genre).on(:touch) do
      search_api('country')
    end

    rmq.append(UIButton, :rnb_genre).on(:touch) do
      search_api('rnb')
    end

  end

  def search_api(search_term)
    Artist.new.artist_results(search_term)
  end

  def init_nav
    self.title = 'Find New Music'

    self.navigationItem.tap do |nav|
      nav.leftBarButtonItem = UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemAction,
                                                                           target: self, action: :nav_left_button)
      nav.rightBarButtonItem = UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemRefresh,
                                                                           target: self, action: :nav_right_button)
    end
  end

  def nav_left_button
    puts 'Left button'
  end

  def nav_right_button
    puts 'Right button'
  end


end


__END__

# You don't have to reapply styles to all UIViews, if you want to optimize,
# another way to do it is tag the views you need to restyle in your stylesheet,
# then only reapply the tagged views, like so:
def logo(st)
  st.frame = {t: 10, w: 200, h: 96}
  st.centered = :horizontal
  st.image = image.resource('logo')
  st.tag(:reapply_style)
end

# Then in willAnimateRotationToInterfaceOrientation
rmq(:reapply_style).reapply_styles
