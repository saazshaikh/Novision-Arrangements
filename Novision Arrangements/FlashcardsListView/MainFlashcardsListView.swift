//
//  MainFlashcardsListView.swift
//  Novision Arrangements
//
//  Created by Saaz Shaikh on 15/10/2023.
//

import SwiftUI

struct MainFlashcardsListView: View {
    
    @ObservedObject var novisionManager: NovisionManager
    @State private var isNewSheetPresented = false
    @State private var showConfirmAlert = false
    
    var body: some View {
        Text("Main view")
    }
}

struct MainFlashcardsListView_Previews: PreviewProvider {
    static var previews: some View {
        MainFlashcardsListView(novisionManager: NovisionManager())
    }
}
