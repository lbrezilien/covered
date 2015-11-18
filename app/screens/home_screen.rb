class HomeScreen < PM::XLFormScreen
  form_options on_save: :my_save_method


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






#
#
# class HomeScreen < PM::FormScreen
#
#         title "Search Covers"
#
#           def form_data
#             [{
#               title: "Search For Song Covers",
#               footer: "Powered by Flatiron Web Students",
#               cells: [
#                 {
#                   placeholder: "Enter a Genre",
#                   name: :genre,
#                   type: :text,
#                    "textLabel.color" => UIColor.blueColor
#                 },{
#                 name: :submit,
#                 title: "Submit",
#                 type: :button,
#                 action: "submit_form:",
#                 properties: { accessoryType: UITableViewCellAccessoryDetailButton}
#               }]
#
#               }]
#           end
#
#           def submit_form(cell)
#             puts render_form
#             data = render_form
#             if data[:genre].is_a?(Float) || data[:genre].is_a?(Fixnum)
#               data[:genre] = UITextField.find
#             end
#
#           puts data
#
#               # Artist.new.results(render_form[:genre])
#           end
#
# end
