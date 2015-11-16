class HomeScreen < PM::FormScreen

        title "Search Covers"

          def form_data
            [{
              title: "Search For Song Covers",
              footer: "Powered by Flatiron Web Students",
              cells: [
                {
                  placeholder: "Enter a Genre",
                  name: :genre,
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
              Artist.new.results(render_form[:genre])
          end

end
