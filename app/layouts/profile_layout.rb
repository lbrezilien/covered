class ProfileLayout < MK::Layout
  view :movies_view
  view :artist_name

  def layout
    root :home do
      add UIImageView, :profile_image
      # add UILabel, :artist_name
      add movies_view, :movies
    end
  end

  def home_style
    background_color "#F9F9F9".uicolor
  end

  def profile_image_style
    image "anonymous.jpg".uiimage
    clips_to_bounds true
    layer do
      corner_radius 10.0
    end
    constraints do
      left 10
      top 84
      width 180
      height 180
    end
  end

  # def artist_name_style
  #   # puts "this is the id #{@artist_name}"
  #   text @artist_name
  #   font UIFont.boldSystemFontOfSize(24)
  #   constraints do
  #     top 148
  #     right_of(:profile_image).plus(20)
  #     height 30
  #   end
  # end

  def movies_style
    top 260
    left 0
    right "100%"
  end
end
