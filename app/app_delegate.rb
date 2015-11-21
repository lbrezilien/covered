class AppDelegate < PM::Delegate

  def on_load(app, options)
    return true if RUBYMOTION_ENV == "test"
    open HomeScreen.new(nav_bar: true)
    open_tab_bar HomeScreen, ArtistResultsScreen, Search, MyList, LogOut
  end

end
