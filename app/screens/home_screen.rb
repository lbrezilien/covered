class HomeScreen < PM::FormScreen

        title "Search Covers"
          def form_data
            [{
              title: "Search For Song Covers",
              footer: "Powered by Flatiron Web Students",
              cells: [{
                placeholder: "Search by title",
                type: :text,
                },
                {
                  placeholder: " Search by Artist",
                  type: :text,
                   "textLabel.color" => UIColor.blueColor
                },{
                name: :submit,
                title: "Submit",
                type: :button,
                action: "submit_form:",
                properties: { accessoryType: UITableViewCellAccessoryDetailButton}
              }]

              }]
          end

          def submit_form(cell)
              render_form
              open SearchResultsScreen
          end

end
