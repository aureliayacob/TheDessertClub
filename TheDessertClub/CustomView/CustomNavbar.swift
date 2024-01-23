//
//  CustomNavbar.swift
//  ConsumeRestApi
//
//  Created by aurel on 22/07/22.
//

import SwiftUI

struct CustomNavbar<Content: View>: View {
    
    let content: Content
    let title: String
    
    init(@ViewBuilder content: () -> Content, title: String){
        self.content = content()
        self.title = title
    }
    var body: some View {
        ZStack{
            
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            VStack{
                CustomNavbarView(title: title)
                Spacer()
            }
        }
    }
}

struct CustomNavbar_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavbar(content: {Color.theme.beige}, title: "Cupcake")
    }
}

