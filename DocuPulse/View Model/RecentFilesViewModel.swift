//
//  RecentFilesViewModel.swift
//  DocuPulse
//
//  Created by Matthew Houston on 7/24/23.
//

import Foundation


class RecentFilesViewModel: ObservableObject {
    
    @Published var recentFiles = [File]()
    
    func fetchRecentFiles() {
        
    }
}
