//
//  OnboardingView.swift
//  DocuPulse
//
//  Created by Matthew Houston on 7/17/23.
//

import SwiftUI

struct OnboardingPageView: View {
    
    var page: OnboardingPage
    let onboardingPageViewModel = OnboardingPageViewModel()
    @Binding var pageIndex: Int
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack {
                VStack {
                    ZStack(alignment: .bottom) {
                        Image("Onboarding-Main-Background")
                            .resizable()
                            .scaledToFit()
                            .padding(.bottom, 50)
                        
                        Image(page.imageTitle)
                            .resizable()
                            .scaledToFit()
                        
                        Spacer()
                            .frame(width: geometry.size.width, height: 150)
                            .background(LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.6), Color.white.opacity(1.0)]),
                                                       startPoint: .top,
                                                       endPoint: .bottom)
                                            .edgesIgnoringSafeArea(.all))
                        
                    }
                    .padding(.top, 35)
                }
                
                VStack {
                    Text(page.title1)
                        .font(.system(size: 23, weight: .bold))
                        .bold()
                        .padding(.bottom, 5)
                    Text(page.title2)
                        .font(.system(size: 23, weight: .bold))
                        .bold()
                        .padding(.bottom, 5)
                    
                    Text(page.description)
                        .font(.system(size: 15, weight: .light))
                    
                    HStack(spacing: 30) {
                        Button {
                            pageIndex = onboardingPageViewModel.onBoardingPageCount
                        } label: {
                            Text("Skip")
                                .padding()
                                .padding(.horizontal, 40)
                                .foregroundColor(Color("darkPurple"))
                                .background(Color("lightPurple"))
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                        }
                        
                        Button {
                            pageIndex += 1
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
                    .padding(.top, 10)
                }
                .padding()
                Spacer()
            }
            .onAppear {
                UserDefaultsManager.shared.set(value: true, forKey: UserDefaultKeys.onboardingScreenSeen)
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPageView(page: MOCK_OnboardingPage, pageIndex: .constant(0))
    }
}
