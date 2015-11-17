class HomeScreen < PM::XLFormScreen
  form_options on_save: :my_save_method


  def form_data
    genres = [
      { id: :male, name: 'Hip Hop' },
      { id: :female, name: 'Rock' },
      { id: :other,  name: 'Other' },
    ]

    [
      {
        title:  'Enter a Genre',
        cells: [
          # {
          #   title:       'Genre',
          #   name:        :email,
          #   type:        :email,
          #   placeholder: 'Enter your email',
          #   required:    true
          # },
          # {
          #   title: 'Name',
          #   name:  :name,
          #   type:  :text,
          #   value: 'Default value'
          # },
          {
            title:  'Multiple value',
            name:   :multi_values,
            options: [:insert, :delete, :reorder],
            cells: [
              {
                title: 'Add a new tag',
                name:  :tag,
                type:  :text
              }
            ]
          },
          {
            title: 'Genre',
            name: :genre,
            type: :selector_push,
            options: Hash[genres.map do |gender|
              [gender[:id], gender[:name]]
            end]
          },
          {
    title:  'Custom section',
    cells: [
      {
        title: 'Custom',
        name:  :custom,
        cells: [
          {
              title: 'Some text',
              name:  :some_text,
              type:  :text
          },
          {
              title: 'Other text',
              name:  :some_other_text,
              type:  :text
          }
        ]
      }
    ]
  }
        #   {
        #    title: 'Save',
        #    name: :save,
        #    type: :button,
        #    on_click: -> (cell) {
        #      on_save(nil)
        #    }
        #  }
        ]
      },

      {
        title:  'Suggestions',
        cells: [
              {
                 title: 'Hip Hop',
                 name: :hip_hop,
                 type: :button,
                 on_click: -> (cell) {
                   on_save('Hip Hop')
                 }
               },
               {
                  title: 'Rock',
                  name: :rock,
                  type: :button,
                  value: 'Rock',
                  on_click: -> (cell) {
                    on_save('Rock')
                  }
                }
        ]
      },
      {
        cells: [

             {
                  title: 'Rock',
                  name: :rock,
                  type: :button,
                  value: 'Rock',
                  on_click: -> (cell) {
                    on_save('Rock')
                  }
                }
        ]
      }

    ]
  end


def my_save_method(values)
  mp values
  #Artist.new.results(render_form[:genre])

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
