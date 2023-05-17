//
//  CulturaViewController.swift
//  Adventure Kaan
//
//  Created by Marco Alonso Rodriguez on 16/05/23.
//

import UIKit

class CulturaViewController: UIViewController {
    
    
    @IBOutlet weak var tablaCultura: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tablaCultura.register(UINib(nibName: "CulturaCelda", bundle: nil), forCellReuseIdentifier: "celda")
        
        tablaCultura.delegate = self
        tablaCultura.dataSource = self

    }
    

    @IBAction func aboutUsButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AboutUsViewController") as! AboutUsViewController
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true)
    }
    

}

extension CulturaViewController:  UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        temasCultura.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! CulturaCelda
        
        celda.nombreTemaCultura.text = temasCultura[indexPath.row].nombre
        celda.imagenCultura.image = temasCultura[indexPath.row].imagen
        
        return celda
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetalleCulturaViewController") as! DetalleCulturaViewController
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        vc.recibirCultura =  temasCultura[indexPath.row]
        present(vc, animated: true)
    }
}
