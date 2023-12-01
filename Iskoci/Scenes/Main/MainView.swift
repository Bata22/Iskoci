//
//  MainView.swift
//  Iskoci
//
//  Created by Vukasin Popovic on 4.10.23..
//

import SwiftUI

struct MainView: View {
	
	init() {
		UISegmentedControl.appearance().selectedSegmentTintColor = .white
		UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .selected)
		UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
		UISegmentedControl.appearance().overrideUserInterfaceStyle = .dark
        UISearchBar.appearance().overrideUserInterfaceStyle = .dark
        UIRefreshControl.appearance().tintColor = .white
	}
    private var viewModel = MainViewModel()
	
    var body: some View {
       TabView {
		   Group {
               
			   homeView
			   searchView
			   favoriteView
			   settingsView
		   }
		   .toolbarBackground(.visible, for: .tabBar)
		   .toolbarBackground(.tabBarBackground, for: .tabBar)
           
	   }
	   .tint(.tabBarForeground)
    }
	
	// MARK: - Properties
	
	private var homeView: some View {
		HomeView()
			.tabItem {
				Label("Početna", image: "home")
			}
	}
	
	private var searchView: some View {
		SearchView()
			.tabItem {
				Label("Pretraga", image: "search")
			}
	}
	
	private var favoriteView: some View {
		FavouriteView()
			.tabItem {
				Label("Omiljeni", image: "favorites")
			}
	}
	
	private var settingsView: some View {
		OpcionsView()
			.tabItem {
				Label("Opcioje", image: "settings")
			}
	}
}

#Preview {
    MainView()
}
