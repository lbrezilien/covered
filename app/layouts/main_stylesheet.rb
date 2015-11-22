class HomeStylesheet < ApplicationStylesheet

  def setup
    # Add sytlesheet specific setup stuff here.
    # Add application specific setup stuff in application_stylesheet.rb
  end

  def root_view(st)
      st.background_color = color.white
      img = rmq.image.resource('back-667h@2x')
      st.background_image = img

 end


# form button styles
  def manual_search(st)
    st.frame = {top: 500, width: 200, height: 40, centered: :horizontal, fr: 5 }
    st.center = st.superview.center
    st.center_x = 140
    st.center_y = 220
    # st.text_alignment = :left
    st.color = color.battleship_gray
    st.font = font.small
    st.color = color.white
    st.background_color = color.black
    st.corner_radius = 3
    border = 3
    border_width=(10)
    border_color = color.battleship_gray
  end

  def submit_button(st)
    st.frame = {top: 200, width: 80, height: 40, centered: :horizontal, }
    st.center = st.superview.center
    st.center_x = 290
    st.center_y = 220
    st.text = 'Search!'
    st.color = color.battleship_gray
    st.font = font.small
    st.color = color.white
    st.background_color = color.battleship_gray
    st.corner_radius = 2

  end
# paint drop styles
  def pop_genre(st)
    st.frame = {top: 300, width: 80, height: 60, centered: :horizontal, }
    st.center = st.superview.center
    st.center_x = 235
    st.center_y = 330
    st.color = color.battleship_gray
    st.font = font.small
    st.color = color.white
    st.background_color = color.clear
    st.text = 'Pop'
  end

  def rock_genre(st)
    st.frame = {top: 300, width: 80, height: 60, centered: :horizontal, }
    st.center = st.superview.center
    st.center_x = 140
    st.center_y = 330
    st.color = color.battleship_gray
    st.font = font.small
    st.color = color.white
    st.background_color = color.clear
    st.text = 'Rock'
  end

  def rap_genre(st)
    st.frame = {width: 80, height: 60, centered: :horizontal, }
    st.center = st.superview.center
    st.center_x = 235
    st.center_y = 415
    st.color = color.battleship_gray
    st.font = font.small
    st.color = color.white
    st.background_color = color.clear
    st.text = 'Rap'
  end

  def jazz_genre(st)
    st.frame = {top: 300, width: 80, height: 60, centered: :horizontal, }
    st.center = st.superview.center
    st.center_x = 145
    st.center_y = 415
    st.color = color.battleship_gray
    st.font = font.small
    st.color = color.white
    st.background_color = color.clear
    st.text = 'Jazz'
  end

  def house_genre(st)
    st.frame = {top: 300, width: 80, height: 60, centered: :horizontal, }
    st.center = st.superview.center
    st.center_x = 65
    st.center_y = 405
    st.color = color.battleship_gray
    st.font = font.small
    st.color = color.white
    st.background_color = color.clear
    st.text = 'House'
  end

  def blues_genre(st)
    st.frame = {top: 300, width: 80, height: 60, centered: :horizontal, }
    st.center = st.superview.center
    st.center_x = 185
    st.center_y = 505
    st.color = color.battleship_gray
    st.font = font.small
    st.color = color.white
    st.background_color = color.clear
    st.text = 'Blues'
  end

  def electronic_genre(st)
    st.frame = {top: 300, width: 80, height: 60, centered: :horizontal, }
    st.center = st.superview.center
    st.center_x = 85
    st.center_y = 500
    st.color = color.battleship_gray
    st.font = font.small
    st.color = color.white
    st.background_color = color.clear
    st.text = 'Electro'
  end

  def country_genre(st)
    st.frame = {top: 300, width: 80, height: 60, centered: :horizontal, }
    st.center = st.superview.center
    st.center_x = 315
    st.center_y = 415
    st.color = color.battleship_gray
    st.font = font.small
    st.color = color.white
    st.background_color = color.clear
    st.text = 'Country'
  end

  def rnb_genre(st)
    st.frame = {top: 300, width: 80, height: 60, centered: :horizontal, }
    st.center = st.superview.center
    st.center_x = 282
    st.center_y = 503
    st.color = color.battleship_gray
    st.font = font.small
    st.color = color.white
    st.background_color = color.clear
    st.text = 'RnB'
  end
end
