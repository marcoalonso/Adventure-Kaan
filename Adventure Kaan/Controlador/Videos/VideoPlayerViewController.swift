//
//  VideoPlayerViewController.swift
//  Adventure Kaan
//
//  Created by Marco Alonso Rodriguez on 16/05/23.
//

import UIKit
import YouTubeiOSPlayerHelper

class VideoPlayerViewController: UIViewController {
    
    var recibirURLVideo: String?

    @IBOutlet weak var playerView: YTPlayerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        playerView.delegate = self
        
        guard let videoURL = recibirURLVideo else { return }
        
        playerView.load(withVideoId: videoURL)
    }
    
    
    

    @IBAction func aboutUsButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AboutUsViewController") as! AboutUsViewController
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true)
    }
    
    
    @IBAction func goBackButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    

}

extension VideoPlayerViewController: YTPlayerViewDelegate {
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        playerView.playVideo()
    }
}
