class HomeScreen < PM::XLFormScreen

  form_options on_save: :my_save_method

  def on_load
    set_tab_bar_item system_item: :more
  end
  
  def form_data
  [{
      title:  'Enter a Genre',
      cells: [
        {
          title:       'Genre',
          name:        :genre,
          type:        :text,
          placeholder: 'Hip Hop',
          required:    true
        },
        {
         title: 'Find New Music!',
         name: :save,
         type: :button,
         on_click: -> (cell) {
           on_save(nil)
         }
       }]
    }]
  end

  def my_save_method(values)
    Artist.new.artist_results(values["genre"])
  end
end

