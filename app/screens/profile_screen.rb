class ProfileScreen < PM::Screen

  title "Profile"

  attr_accessor :artists, :info, :view_to_load
    def on_load
        @layout = ProfileLayout.new(root: self.view)
        @view_to_load == 'albums' ? @layout.artist_name = @info[0][2] : @layout.artist_name = @info[0][1]
        @layout.movies_view = movies_screen.view
        @layout.build

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





#   attr_accessor :artists, :albums
#
#   def on_load
#     @layout = HomeLayout.new(root: self.view, pic_id: @albums)
#     @layout.movies_view = movies_screen.view
#     @layout.build
#   end
#
#   def movies_screen
#     @movies_screen ||= begin
#     m = AlbumResultsScreen.new(list: @albums)
#     self.addChildViewController m
#     m.parent_screen = self
#     m
#     end
#   end
# end

# class HomeLayout < MK::Layout

#   attr_accessor :pic_id

#   view :movies_view

# =======
#     title "Artists Profile"
#     attr_accessor :artists, :albums, :view_to_load
#     def on_load
#         @layout = HomeLayout.new(root: self.view)
#         @view_to_load == 'albums' ? @layout.artist_name = @albums[0][2] : @layout.artist_name = @albums[0][1]
#         @layout.movies_view = movies_screen.view
#         @layout.build
#     end



#     def movies_screen
#       if @view_to_load == 'albums'
#             @movies_screen ||= begin
#             m = AlbumResultsScreen.new(list:@albums )
#             self.addChildViewController m
#             m.parent_screen = self # Automatically a weak reference
#             m
#             end
#       else
#         @movies_screen ||= begin
#         m = SongResultsScreen.new(list:@albums )
#         self.addChildViewController m
#         m.parent_screen = self # Automatically a weak reference
#         m
#         end
#       end

#     end

# end

#
# class HomeLayout < MK::Layout
#   view :movies_view
#   view :artist_name
#
#   def layout
#     root :home do
#       add UIImageView, :profile_image
#       add UILabel, :artist_name
#       add movies_view, :movies
#     end
#   end
#
#   def home_style
#     background_color "#F9F9F9".uicolor
#   end
#
#   def profile_image_style
#     image "jimcarrey".uiimage
#     clips_to_bounds true
#     layer do
#       corner_radius 50.0
#     end
#     constraints do
#       left 20
#       top 84
#       width 150
#       height 150
#     end
#   end
#
#   def artist_name_style
#     # puts "this is the id #{@artist_name}"
#     text @artist_name
#     font UIFont.boldSystemFontOfSize(40)
#     constraints do
#       top 148
#       right_of(:profile_image).plus(20)
#       height 30
#     end
#   end
#
#   def movies_style
#     top 260
#     left 0
#     right "100%"
#   end
# end
