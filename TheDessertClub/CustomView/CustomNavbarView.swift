//
//  CustomNavbarView.swift
//  TheDessertClub
//
//  Created by aurel on 09/08/22.
//

import SwiftUI

struct CustomNavbarView: View {
    @Environment(\.presentationMode) var presentationMode
    let title: String
    
    var body: some View {
        HStack(alignment: .center){
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "chevron.left")
                    .font(.system(size: 20, weight: .bold))
                    .padding(.horizontal, 5)
                    .foregroundColor(Color.theme.cream)
                
            }
            .foregroundColor(Color.white)
            Spacer()
            
            Text(title)
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(Color.white)
            
            Spacer()
            
            Button {
            } label: {
                Image(systemName: "chevron.left")
                    .font(.system(size: 20, weight: .bold))
                    .padding(.horizontal, 5)
                
            }
            .opacity(0.0)
            .disabled(true)
        }
        .padding()
        .background(Color.clear.ignoresSafeArea(edges: .top))
    }
}



struct CustomNavbarView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CustomNavbarView(title: "About")
            Spacer()
        }
        .background(.red)
    }
}
