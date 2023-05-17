//
//  DetalleZonaViewController.swift
//  Adventure Kaan
//
//  Created by Marco Alonso Rodriguez on 16/05/23.
//

import UIKit
import MapKit

class DetalleZonaViewController: UIViewController {
    
    @IBOutlet weak var lugarZona: UILabel!
    @IBOutlet weak var mapaZona: MKMapView!
    @IBOutlet weak var textoHistoriaZona: UITextView!
    @IBOutlet weak var imagenZona: UIImageView!
    
    
    var recibirZona: ZonaData?

    override func viewDidLoad() {
        super.viewDidLoad()

        configurarUI()
    }
    
    private func configurarUI(){
        guard let zonaMostrar = recibirZona else { return }
        lugarZona.text = zonaMostrar.nombre
        imagenZona.image = zonaMostrar.imagen
        textoHistoriaZona.text = zonaMostrar.textoHistoria
        
        //Ubicacion
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: zonaMostrar.latitud, longitude: zonaMostrar.longitud)
        annotation.title = zonaMostrar.nombre
        
        mapaZona.addAnnotation(annotation)
        
        ///Nivel de zoom al mapa
        let spanMapa = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let regionMapa = MKCoordinateRegion(center: annotation.coordinate, span: spanMapa)
        
        ///Agregar la region al mapa y mostrar la ubicacion del usuario
        mapaZona.setRegion(regionMapa, animated: true)
        mapaZona.showsUserLocation = true
    }
    
    
    @IBAction func aboutUsButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AboutUsViewController") as! AboutUsViewController
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true)
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    

}
