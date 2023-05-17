//
//  ViewController.swift
//  Adventure Kaan
//
//  Created by Marco Alonso Rodriguez on 16/05/23.
//

import UIKit
import MapKit

class ZonasViewController: UIViewController {
    
    
    @IBOutlet weak var mapaZonas: MKMapView!
    @IBOutlet weak var tablaZonas: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tablaZonas.register(UINib(nibName: "ZonaCelda", bundle: nil), forCellReuseIdentifier: "celda")
        
        mapaZonas.delegate = self
        
        tablaZonas.delegate = self
        tablaZonas.dataSource = self
        
        showAnnotations()
    
    }
    
    private func showAnnotations(){
        
        for lugar in zonas {
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: lugar.latitud, longitude: lugar.longitud)
            annotation.title = lugar.nombre
            
            mapaZonas.addAnnotation(annotation)
        }
        

    }
    
    
    @IBAction func aboutUsButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetalleZonaViewController") as! DetalleZonaViewController
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    
}

extension ZonasViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // Personaliza el aspecto del marcador en función de tu preferencia
        // Puedes utilizar MKMarkerAnnotationView, MKPinAnnotationView u otros
        
        // Ejemplo utilizando MKMarkerAnnotationView:
        let identifier = "CustomAnnotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView
        
        if annotationView == nil {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        } else {
            annotationView?.annotation = annotation
        }
        
        // Personaliza la apariencia del marcador
        annotationView?.markerTintColor = UIColor.red
//        annotationView?.glyphText = "1"
        
        return annotationView
    }
    
}

extension ZonasViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        zonas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! ZonaCelda
        
        celda.tituloZonaLabel.text = zonas[indexPath.row].nombre
        celda.imagenZona.image = zonas[indexPath.row].imagen
        
        
        return celda
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
}

