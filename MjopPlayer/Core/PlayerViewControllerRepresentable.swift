//
//  PlayerViewControllerRepresentable.swift
//  MjopPlayer
//
//  Created by Marcos Joshoa on 02/05/24.
//

import SwiftUI
import AVKit

struct PlayerViewControllerRepresentable: UIViewControllerRepresentable {
    @ObservedObject var viewModel: VideoPlayerViewModel

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.player = viewModel.player
        return controller
    }

    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        uiViewController.player = viewModel.player
    }
}
