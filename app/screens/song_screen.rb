class SongScreen < PM::Screen
  attr_accessor :info

  puts @items

  def on_load
    @items = @info
  end

end
