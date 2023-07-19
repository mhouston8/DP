//
//  HomeView.swift
//  DocuPulse
//
//  Created by Matthew Houston on 7/18/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello")
                    .navigationTitle("DocuPulse")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                print("search")
                            } label: {
                                Image(systemName: "magnifyingglass")
                            }
                        }
                    }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
