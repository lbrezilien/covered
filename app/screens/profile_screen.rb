class ProfileScreen < PM::Screen
  
  title "Artists Profile"
  
  attr_accessor :artists, :albums

  def on_load
    @layout = HomeLayout.new(root: self.view, pic_id: @albums)
    @layout.movies_view = movies_screen.view
    @layout.build
  end

  def movies_screen
    @movies_screen ||= begin
    m = AlbumResultsScreen.new(list: @albums)
    self.addChildViewController m
    m.parent_screen = self 
    m
    end
  end
end

class HomeLayout < MK::Layout
  
  attr_accessor :pic_id

  view :movies_view
  
  def layout
    root :home do
      add UIImageView, :profile_image
      add UILabel, :profession
      add movies_view, :movies
    end
  end

  def home_style
    background_color "#F9F9F9".uicolor
  end

  def profile_image_style
    image "jimcarrey".uiimage
    clips_to_bounds true
    layer do
      corner_radius 50.0
    end
    constraints do
      left 20
      top 84
      width 100
      height 100
    end
  end

  def profession_style
    puts "this is the id #{@pic_id}"
    text "Jim Carrey"
    font UIFont.boldSystemFontOfSize(20)
    constraints do
      top 118
      right_of(:profile_image).plus(20)
      height 30
    end
  end

  def movies_style
    top 200
    left 0
    right "100%"
  end
end
