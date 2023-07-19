//
//  OnboardingPageView.swift
//  DocuPulse
//
//  Created by Matthew Houston on 7/18/23.
//

import SwiftUI

struct OnboardingPageView: View {
    @State private var pageIndex = 0
    private let viewModel = OnboardingPageViewModel()
    
    var body: some View {
        
        if pageIndex >= viewModel.onBoardingPageCount {
            MainTabView()
        } else {
            TabView(selection: $pageIndex) {
                ForEach(viewModel.getOnboardingPages().indices, id: \.self) { index in
                    OnboardingPage(page: viewModel.getOnboardingPages()[index], pageIndex: $pageIndex)
                        .tag(index)
                }
            }
            .animation(.linear, value: pageIndex)
            .tabViewStyle(.page)
        }
    }
}

struct OnboardingPageView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPageView()
    }
}
