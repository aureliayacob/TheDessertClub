//
//  AboutViews.swift
//  TheDessertClub
//
//  Created by aurel on 09/08/22.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack{
            CustomNavbarView(title: "About")
            Spacer()
                .frame(maxHeight: 25)
            Image("aurel")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .clipShape(Circle())
                .padding()
            Text("Devida Aurelia Yacob")
                .font(.headline)
            Text("Tangerang, Banten")
                .font(.subheadline)
            Spacer()
            
        }
        .foregroundColor(Color.white)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.theme.darkbrown)
    }
}

struct AboutViews_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
