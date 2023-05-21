//
//  DetalleCulturaViewController.swift
//  Adventure Kaan
//
//  Created by Marco Alonso Rodriguez on 16/05/23.
//

import UIKit

class DetalleCulturaViewController: UIViewController {
    
    var recibirCultura : TemaCultura?
    
    var imagenesCultura = [UIImage(named: "calendario")]
    
    @IBOutlet weak var culturaCollection: UICollectionView!
    @IBOutlet weak var textoCultura: UITextView!
    @IBOutlet weak var tituloCultura: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurarUI()
        
        culturaCollection.dataSource = self
        culturaCollection.delegate = self
        
        culturaCollection.collectionViewLayout = UICollectionViewFlowLayout()
        
        if let flowLayout = culturaCollection.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let nombreCultura = recibirCultura {
            mostrarImagenesCollection(tema: nombreCultura.nombre)
        }
    }
    
    private func configurarUI(){
        guard let culturaMostrar = recibirCultura else { return }
        textoCultura.text = culturaMostrar.texto
        tituloCultura.text = culturaMostrar.nombre
        
        
    }
    
    func mostrarImagenesCollection(tema: String){
        print("Debug: tema \(tema)")

        imagenesCultura.removeAll()
        
        switch tema {
        case "Historia":
            imagenesCultura = imagenesHistoria
            
        case "Religión":
            imagenesCultura = imagenesReligion
            
        case "Arte":
            imagenesCultura = imagenesArte
            
        case "Agricultura":
            imagenesCultura = imagenesAgricultura
            
        case "Astronomía":
            imagenesCultura = imagenesAstronomia
            
        case "Calendario":
            imagenesCultura = imagenesCalendario
            culturaCollection.reloadData()
            
        default:
            print("Historia")
        }
        
        
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

//EXTENSION
extension DetalleCulturaViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 290, height: 240)
    }
}

extension DetalleCulturaViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        imagenesCultura.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celda = collectionView.dequeueReusableCell(withReuseIdentifier: "celda", for: indexPath) as! DetalleCelda
        
        celda.imagenCultura.image = imagenesCultura[indexPath.row]
        celda.imagenCultura.layer.cornerRadius = 15
        celda.imagenCultura.layer.masksToBounds = true
        
        return celda
    }

    
}
