//
//  ContentView.swift
//  FinancialSentimentAnalysis
//
//  Created by Utkarsh Raj on 02/11/24.
//

import SwiftUI
import CoreML


struct ContentView: View {
    @State private var text = ""
    @State private var result = ""
    let model = try! SentimentModel(configuration: MLModelConfiguration())
    
    private func sentimentColorMap(sentiment: String) -> Color {
        switch sentiment {
        case "positive":
            return .green
        case "negative":
            return .red
        default:
            return .white
        }
    }
    var body: some View {
        VStack {
            
            TextField(text: $text) {
                Text("Enter the text")
            }
            HStack {
                Text("Sentiment")
                Spacer()
                Text(result)
            }
            Spacer()
            Button(action: {
                do {
                    result = try model.prediction(text: text).label
                } catch let error {
                    print(error.localizedDescription)
                }
            }, label: {
                Text("Calculate")
            })
            .buttonStyle(.borderedProminent)
            
            
        }
        .padding()
        .background(sentimentColorMap(sentiment: result))
    }
}

#Preview {
    ContentView()
}
