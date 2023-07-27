//
//  HomeViewCell.swift
//  DocuPulse
//
//  Created by Matthew Houston on 7/26/23.
//

import SwiftUI

struct HomeViewCell: View {
    
    let imageName: String
    let title: String
    let buttonTapped: (() -> Void)
    
    var body: some View {
        VStack {
            
            Button {
                //send action
                buttonTapped()
            } label: {
                
                VStack {
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 45, height: 45)
                    Text(title)
                        .font(.system(size: 11, weight: .semibold))
                        .foregroundColor(.black)
                }
            }
        }
    }
}

struct HomeViewCell_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewCell(imageName: "", title: "", buttonTapped: {})
    }
}
