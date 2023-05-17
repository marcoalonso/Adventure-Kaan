//
//  DetalleCulturaViewController.swift
//  Adventure Kaan
//
//  Created by Marco Alonso Rodriguez on 16/05/23.
//

import UIKit

class DetalleCulturaViewController: UIViewController {
    
    var recibirCultura : TemaCultura?
    
    
    @IBOutlet weak var imagenCultura: UIImageView!
    @IBOutlet weak var textoCultura: UITextView!
    @IBOutlet weak var tituloCultura: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    private func configurarUI(){
        guard let mostrarCultura = recibirCultura else { return }
        
    }
   
    
    @IBAction func goBackButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func aboutUsButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AboutUsViewController") as! AboutUsViewController
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true)
    }
    

}
