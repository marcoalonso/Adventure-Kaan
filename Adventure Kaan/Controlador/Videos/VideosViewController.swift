//
//  VideosViewController.swift
//  Adventure Kaan
//
//  Created by Marco Alonso Rodriguez on 16/05/23.
//

import UIKit

class VideosViewController: UIViewController {
   
    

    
    var videos: [Video] = [
        Video(nombre: "Los Mayas en dibujos animados", imagenVideo: UIImage(named: "bg_videos_1")!, urlVideo: "mrTzjGYHJxI"),
        
        Video(nombre: "¿Qué diferencia a los aztecas de los mayas?", imagenVideo: UIImage(named: "bg_videos_2")!, urlVideo: "9yc4JIMcZQg"),
        
        Video(nombre: "Historia Maya", imagenVideo: UIImage(named: "bg_videos_3")!, urlVideo: "rv3k9mGTRvo"),
        
        Video(nombre: "La cultura maya en 3 minutos", imagenVideo: UIImage(named: "bg_videos_4")!, urlVideo: "Pmb-h56Nt9M"),
        
        Video(nombre: "El juego sagrado de los mayas", imagenVideo: UIImage(named: "bg_videos_5")!, urlVideo: "Y0pc8TFEqMw"),
    ]
    
    @IBOutlet weak var tablaVideos: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tablaVideos.register(UINib(nibName: "VideoCell", bundle: nil), forCellReuseIdentifier: "celda")
        
        tablaVideos.delegate = self
        tablaVideos.dataSource = self
    }
    

    
    
    @IBAction func aboutUsButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AboutUsViewController") as! AboutUsViewController
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true)
    }
    

}

extension VideosViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! VideoCell
        
        celda.imagenVideo.image = videos[indexPath.row].imagenVideo
        celda.tituloVideoLabel.text = videos[indexPath.row].nombre
        
        return celda
    }
}

struct Video {
    let nombre: String
    let imagenVideo: UIImage
    let urlVideo: String
}
