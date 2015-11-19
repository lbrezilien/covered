class AppDelegate < PM::Delegate

  def on_load(app, options)
    return true if RUBYMOTION_ENV == "test"
    open HomeScreen.new(nav_bar: true)
    open_tab_bar HomeScreen, Search, MyList, LogOut
  end

  def build_tabbar
    tabbar = UITabBarController.alloc.init
    tabbar.viewControllers = [
      UINavigationController.alloc.initWithRootViewController(SearchController.alloc.init),
      UINavigationController.alloc.initWithRootViewController(MyListController.alloc.init),
      UINavigationController.alloc.initWithRootViewController(LogOutController.alloc.init)
    ]
    tabbar.selectedIndex = 0
    tabbar.delegate = self
    tabbar
  end

end
