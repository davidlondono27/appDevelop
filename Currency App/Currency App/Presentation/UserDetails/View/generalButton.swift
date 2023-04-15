//
//  generalButton.swift
//  Currency App
//
//  Created by David Santiago Londono Giraldo on 2/04/23.
//

import SwiftUI

struct generalButton: View {
    var buttonImage: String
    
    var body: some View {
        VStack(){
            Image(systemName: buttonImage)
                .font(.system(size: 30))
            Text("Hola")
        }
    }
}

struct generalButton_Previews: PreviewProvider {
    static var previews: some View {
        generalButton(buttonImage: "network")
    }
}
