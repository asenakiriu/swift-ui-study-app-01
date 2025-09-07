//
//  ContentView.swift
//  nyan-demo1
//
//  Created by HFSD-079 on 2025/08/22.
//

import SwiftUI

struct ContentView: View {
    // 文字を管理する魔法の箱
    @State private var message = "こんにちは、あせにゃん！"
    let messages = ["にゃーん！元気！", "今日もふわふわ！", "がんばれあせにゃん！", "ねこはかわいいにゃん！", "みゃんみゃみゃん！"]
    
    @State private var isBig = false

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "pawprint.fill") // ←アイコン名
                .resizable()
                .scaledToFit()
                .foregroundColor(isBig ? Color(red: 1.0, green: 0.7, blue: 0.8) : .brown) // 色
                .scaleEffect(isBig ? 1.0 : 0.6)
                .frame(maxWidth: 150, maxHeight: 150) // 最大サイズ
                .rotationEffect(.degrees(isBig ? 15 : 0))
                .animation(.interpolatingSpring(stiffness: 100, damping: 5), value: isBig)            // 表示する文字
            Text(message)
                .font(.system(size: 28, weight: .bold, design: .rounded)) // 丸っこい文字に
                .foregroundColor(Color(red: 0/255, green: 0/255, blue: 139/255)) // 文字の色
                .padding()
                .background(Color(red: 230/255, green: 238/255, blue: 242/255)) //くすみブルー
                .cornerRadius(15)
            // ボタン
            Button(action: {
                isBig.toggle()
                message = messages.randomElement()!
            }) {
                HStack {
                    Text("押してにゃん！")
                    Image(systemName: "pawprint.fill")
                        .foregroundColor(.brown)
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
