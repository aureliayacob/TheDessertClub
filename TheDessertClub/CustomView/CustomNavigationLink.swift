//
//  CustomNavigationLink.swift
//  ConsumeRestApi
//
//  Created by aurel on 22/07/22.
//

import SwiftUI

struct CustomNavigationLink<Label: View, Destination: View>: View {
    let destination: Destination
    let label: Label
    let largeTitle: String
    
    
    public init(destination: Destination, title: String = "", @ViewBuilder label: () -> Label)
    {
        self.destination  = destination
        self.label = label()
        self.largeTitle = title
    }
    
    var body: some View {
        NavigationLink(
            destination:  CustomNavbar(content: {destination}, title: largeTitle)
                .navigationBarHidden(true)
            ,
            label: {
                label
                
            })
    }
}




struct CustomNavigationLink_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationLink(destination:  Text(""), title: "Cupcakes", label: {})
    }
}
