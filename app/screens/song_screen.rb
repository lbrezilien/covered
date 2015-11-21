class SongScreen < PM::Screen
 
  attr_accessor :info

  def on_load
    @items = @info
  end
end
