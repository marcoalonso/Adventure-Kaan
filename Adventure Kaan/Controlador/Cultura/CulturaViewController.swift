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
}
