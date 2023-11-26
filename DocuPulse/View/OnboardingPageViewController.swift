//
//  OnboardingPageView.swift
//  DocuPulse
//
//  Created by Matthew Houston on 7/18/23.
//

import SwiftUI

struct OnboardingPageViewController: View {
    @State private var pageIndex = 0
    private let viewModel = OnboardingPageViewModel()
    
    var body: some View {
        
        if pageIndex >= viewModel.onBoardingPageCount {
            WelcomeView()
        } else {
            TabView(selection: $pageIndex) {
                ForEach(viewModel.onBoardingPages.indices, id: \.self) { index in
                    OnboardingPageView(page: viewModel.onBoardingPages[index], pageIndex: $pageIndex)
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
        OnboardingPageViewController()
    }
}
