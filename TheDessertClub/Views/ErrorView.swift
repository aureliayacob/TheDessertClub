//
//  ErrorView.swift
//  TheDessertClub
//
//  Created by aurel on 09/08/22.
//

import SwiftUI

struct ErrorView: View {
    var message: String
    
    var body: some View {
        Text(message)
            .foregroundColor(Color.theme.darkbrown)
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(message: "Internet Error")
    }
}
