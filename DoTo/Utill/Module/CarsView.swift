//
//  CarsView.swift
//  DoTo
//
//  Created by shndrs on 3/5/22.
//

import SwiftUI

struct CarsView: View {
    
    var body: some View {
        NavigationView {
            List(0 ..< 4) { item in
                HStack {
                    Image("my location")
                        .resizable()
                        .frame(width: 25, height: 25)
                    VStack(alignment: .leading) {
                        Text("Ferrari")
                        Text("FXXK Evo")
                            .foregroundColor(Color.red)
                    }
                }
            }.navigationBarTitle(Text("Scuderia Ferrari"))
        }
    }
    
}

struct CarsView_Previews: PreviewProvider {
    static var previews: some View {
        CarsView()
    }
}
