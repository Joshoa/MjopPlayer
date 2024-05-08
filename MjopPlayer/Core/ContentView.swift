//
//  ContentView.swift
//  MjopPlayer
//
//  Created by Marcos Joshoa on 06/05/24.
//

import SwiftUI
import Combine

struct ContentView: View {
    @StateObject var viewModel = VideoPlayerViewModel()
    @FocusState private var isTextFieldFocused: Bool
    @State private var videoURLText: String = ""
    @State private var keyboardHeight: CGFloat = 0
    private let keyboardPublisher = Publishers.keyboardHeight
    
    var body: some View {
        VStack {
            ZStack {
                if viewModel.player.currentItem != nil {
                    PlayerViewControllerRepresentable(viewModel: viewModel)
                        .frame(height: UIScreen.main.bounds.height / 2)
                } else {
                    Text("No video selected")
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .font(.headline)
                        .foregroundColor(.blue)
                }
            }
            .padding(.bottom, 24)
            
            TextField("Enter the video URL here", text: $videoURLText)
                .focused($isTextFieldFocused)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 20)
                .padding(.bottom, 8)
            
            // Botão estilizado
            Button(action: {
                guard let url = URL(string: videoURLText) else { return }
                viewModel.videoURL = url
                isTextFieldFocused = false
            }) {
                Text("Load Video")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 50)
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .bold))
                    .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.mint]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(25)
                    .padding(.horizontal, 20)
            }
        }
        .padding(.bottom, keyboardHeight)
        .onReceive(keyboardPublisher) { height in
            withAnimation {
                self.keyboardHeight = height
            }
        }
    }
}
