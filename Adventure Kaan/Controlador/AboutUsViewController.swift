//
//  AboutUsViewController.swift
//  Adventure Kaan
//
//  Created by Marco Alonso Rodriguez on 16/05/23.
//

import UIKit
import WebKit

class AboutUsViewController: UIViewController {
    
    
    @IBOutlet weak var webPage: WKWebView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        loadWebPage()
        
    }
    
    private func loadWebPage(){
        if let url = URL(string: "https://adventure-kaan.webnode.mx/") {
            let request = URLRequest(url: url)
            webPage.load(request)
        }
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    

    

}
