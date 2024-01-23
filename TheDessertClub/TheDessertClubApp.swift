//
//  TheDessertClubApp.swift
//  TheDessertClub
//
//  Created by nexsoft nexsoft on 09/08/22.
//

import SwiftUI

@main
struct TheDessertClubApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView{
                HomeView()
            }
            .navigationViewStyle(.stack)
        }
    }
}
