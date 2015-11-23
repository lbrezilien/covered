class ResultStylesheet < ApplicationStylesheet

  def setup
    # Add sytlesheet specific setup stuff here.
    # Add application specific setup stuff in application_stylesheet.rb
  end

  def root_view(st)
      st.background_color = color.white
      img = rmq.image.resource('results-667h@2x')
      st.background_image = img

 end


 def result_label(st)
  st.frame = {width: 290, height: 40, centered: :horizontal, fr: 5 }
   st.center = st.superview.center
   st.center_x = 222
   st.center_y = 140
   st.font = font.small
   st.text = "Don't care for those artists?"
   st.color = color.black
   st.background_color = color.clear
 end

  def try_again(st)
    st.frame = {top: 300, width: 80, height: 60, centered: :horizontal, }
    st.center = st.superview.center
    st.center_x = 190
    st.center_y = 220
    st.color = color.battleship_gray
    st.font = font.small
    st.color = color.white
    st.background_color = color.clear
    st.text = 'Try Again'
  end
end
