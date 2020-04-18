//
//  ViewController.swift
//  AudioPlayerSample
//
//  Created by KS on 2019/04/29.
//  Copyright © 2019 KS. All rights reserved.
//

import AVKit
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didTapButton() {
        guard let path = Bundle.main.path(forResource: "file_example_MP3_700KB", ofType:"mp3") else {
            debugPrint("Audio not found")
            return
        }
        let fileUrl = URL(fileURLWithPath: path)

        AudioPlayer.shared.playSound(fileUrl: fileUrl)
    }
}

final class AudioPlayer {

    static let shared = AudioPlayer()

    private var player: AVAudioPlayer?

    func playSound(fileUrl: URL) {
        if let player = player, player.isPlaying {
            self.player?.stop()
            self.player = nil
        }

        player = try? AVAudioPlayer(contentsOf: fileUrl)
        player?.play()
    }
}
