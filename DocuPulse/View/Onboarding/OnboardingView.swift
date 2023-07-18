//
//  OnboardingView.swift
//  DocuPulse
//
//  Created by Matthew Houston on 7/17/23.
//

import SwiftUI

struct OnboardingView: View {
    
    var body: some View {
        VStack {
            ZStack {
                Image("Onboarding-Main-Background")
                    .resizable()
                    .scaledToFit()
                
                Image("Phone Mock")
                    .resizable()
                    .scaledToFit()
            }
            .padding(.top, 35)
            
            VStack {
                Text("Scan all your documents")
                    .font(.system(size: 23, weight: .bold))
                    .bold()
                    .padding(.bottom, 5)
                Text("quickly and easily")
                    .font(.system(size: 23, weight: .bold))
                    .bold()
                    .padding(.bottom, 5)
                
                Text("Conveniently scan, save, and share in minutes. Scan anywhere with ease.")
                    .font(.system(size: 15, weight: .light))
                
                HStack(spacing: 17) {
                    Button {
                        print("Skip pressed")
                    } label: {
                        Text("Skip")
                            .padding()
                            .padding(.horizontal, 40)
                            .foregroundColor(Color("darkPurple"))
                            .background(Color("lightPurple"))
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                    
                    Button {
                        print("Next pressed")
                    } label: {
                        Text("Next")
                            .padding()
                            .padding(.horizontal, 40)
                            .foregroundColor(.white)
                            .background(Color("darkPurple"))
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    }

                }
                .padding()
            }
            .padding()
            Spacer()
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
