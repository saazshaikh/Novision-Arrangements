//
//  QandADetailView.swift
//  Novision Arrangements
//
//  Created by Saaz Shaikh on 15/10/2023.
//

import SwiftUI

struct QandADetailView: View {
    
    @ObservedObject var novisionManager: NovisionManager
    
    var body: some View {
        Text("QandADetailView")
    }
}

struct QandADetailView_Previews: PreviewProvider {
    static var previews: some View {
        QandADetailView(novisionManager: NovisionManager())
    }
}
