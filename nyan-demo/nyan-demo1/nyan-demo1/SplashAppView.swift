//
//  SplashAppView.swift
//  nyan-demo1
//
//  Created by HFSD-079 on 2025/09/07.
//

import SwiftUI

struct SplashAppView: View {
    
    @State private var isLoading: Bool = true
    
    var body: some View {
        if isLoading {
            ZStack {
                Color.white.ignoresSafeArea()
                Image("nyan-icon-01")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation {
                        isLoading = false
                    }
                    
                }
            }
        } else {
            Content2View()
        }
    }
}

#Preview {
    SplashAppView()
}
