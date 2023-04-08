//
//  generalButton.swift
//  Currency App
//
//  Created by David Santiago Londono Giraldo on 2/04/23.
//

import SwiftUI

struct generalButton: View {
    var image: String
    
    var body: some View {
        VStack(){
            Image(systemName: image)
                .font(.system(size: 30))
            Text("Hola")
                
        }
    }
}

struct generalButton_Previews: PreviewProvider {
    static var previews: some View {
        generalButton(image: "network")
    }
}
