class ArtistLayout < MK::Layout
  view :artists_view

  def layout
    root :home do
      add UIImageView, :profile_image
      add artists_view, :artist_table
    end
  end

  def home_style
    background_color "#000000".uicolor
  end

  def artist_table_style
    @table
    constraints do
      left 150
      top 0
      bottom 15
      width 370
      height 200
    end

  end

  def profile_image_style
    image "jimcarrey".uiimage
    clips_to_bounds true
    layer do
      corner_radius 2.0
    end
    constraints do
      left 0
      top 0
      bottom 15
      width 370
      height 200
    end
  end
end
