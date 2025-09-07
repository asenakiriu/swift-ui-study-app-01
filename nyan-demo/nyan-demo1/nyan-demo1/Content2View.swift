//
//  Content2View.swift
//  nyan-demo1
//
//  Created by HFSD-079 on 2025/08/27.
//

import SwiftUI

// 猫とストレッチデータ
struct Cat: Identifiable {
    let id = UUID()
    let name: String
    let stretchSteps: [String] // ステップごとの説明を配列で持つ
}


let cats = [
    Cat(name: "クロ", stretchSteps: ["背伸びストレッチ\n椅子に深く座って両手を頭の上にぐーん！\n深呼吸10秒にゃ！", "肩回し\n肩に手を置いて後ろに5回、前に5回まわすにゃ！", "胸開き\n両手を後ろで組んで胸をぐっと開くにゃ！深呼吸3回"]),
    Cat(name: "ミケ", stretchSteps: ["首ストレッチ\n右手で頭を左に軽く傾ける10秒\n反対も同じにゃ", "足裏トントン\nかかとを上げてつま先で10回トントンにゃ", "腕伸ばし\n手を前で組んでぐーっと伸ばすにゃ"]),
    Cat(name: "マダラ", stretchSteps: ["肩上げ\n肩を耳に近づけてストン\n3回繰り返すにゃ", "手首回し\n手首をゆっくり回すにゃ", "背中ねじり\n椅子に座ったまま体を左右にひねるにゃ"])
]

struct Content2View: View {
    var body: some View {
        NavigationStack {
            List(cats) { cat in
                NavigationLink(destination: StretchDetailView(cat: cat)) {
                    HStack {
                        Image(systemName: "pawprint.fill")
                            .foregroundColor(Color(red: 0.6, green: 0.3, blue: 0.1)) // 肉球だけ茶色
                        Text(cat.name + "のススメ")
                            .foregroundColor(Color(red: 0.1, green: 0.1, blue: 0.1)) // 文字は黒
                    }
                    .font(.title2)
                    .padding(5)
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("ねこストレッチ")
                        .font(.system(size: 20, weight: .semibold)) // フォントサイズや太さを細かく指定
                        .foregroundColor(Color(red: 0.1, green: 0.1, blue: 0.1))
                        .padding(.top, 60) // 上下の位置を微調整
                }
            }
        }
    }
}

struct StretchDetailView: View {
    let cat: Cat
    @State private var step = 0 // 今読んでいるステップ
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "cat.fill")
                .font(.system(size: 80))
                .foregroundColor(.black)
            
            Text(cat.name + " のおすすめ")
                .font(.largeTitle)
            
            Text(cat.stretchSteps[step])
                .font(.title3)
                .padding()
                .multilineTextAlignment(.center)
            
            HStack {
                // 前のステップに戻る
                if step > 0 {
                    Button("戻る") {
                        step -= 1
                    }
                    .buttonStyle(.bordered)
                }
                
                // 間を空ける
                Spacer()
                
                // 次のステップ
                if step < cat.stretchSteps.count - 1 {
                    Button("次へ") {
                        step += 1
                    }
                    .buttonStyle(.borderedProminent)
                }
                
            }
            .padding(.horizontal)
            Spacer()
        }
        .padding()
        .navigationTitle(cat.name)
    }
}

struct Content2View_Previews: PreviewProvider {
    static var previews: some View {
        Content2View()
    }
}


