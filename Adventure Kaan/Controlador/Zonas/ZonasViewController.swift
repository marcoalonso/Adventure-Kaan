//
//  ViewController.swift
//  Adventure Kaan
//
//  Created by Marco Alonso Rodriguez on 16/05/23.
//

import UIKit
import MapKit

class ZonasViewController: UIViewController {
    
    
    var latitud: Double = 18.42078245
    var longitud: Double = -88.7926221
    
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
        let vc = storyboard.instantiateViewController(withIdentifier: "AboutUsViewController") as! AboutUsViewController
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true)
    }
    
  // MARK:  Maps
    
    @IBAction func goMaps(_ sender: UIButton) {

        func openGoogleMapsWithCoordinates(latitude: Double, longitude: Double) {
            if let url = URL(string: "comgooglemaps://?center=\(latitude),\(longitude)&zoom=14&views=traffic") {
                if UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                } else {
                    print("Google Maps no está instalado en el dispositivo.")
                    // Puedes abrir la versión web de Google Maps en Safari como alternativa
                    if let webURL = URL(string: "https://maps.google.com/?q=\(latitude),\(longitude)") {
                        UIApplication.shared.open(webURL, options: [:], completionHandler: nil)
                    }
                }
            }
        }

        // Llamar a la función para abrir Google Maps con las coordenadas deseadas
        let latitude = latitud
        let longitude = longitud
        openGoogleMapsWithCoordinates(latitude: latitude, longitude: longitude)


    }
    
    
}

extension ZonasViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "CustomAnnotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView
        
        if annotationView == nil {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        } else {
            annotationView?.annotation = annotation
        }
        
        annotationView?.markerTintColor = UIColor.red
        
        return annotationView
    }
    
    
    func mapView(_ mapView: MKMapView, didSelect annotation: MKAnnotation) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.warning)
        
    }
    
    
    //Seleccion annotation
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if let annotation = view.annotation as? MKPointAnnotation {
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.warning)
            // Se seleccionó un MKPointAnnotation en el mapa
            // Aquí puedes realizar las acciones deseadas
            latitud = annotation.coordinate.latitude
            longitud = annotation.coordinate.longitude
            print("Se seleccionó un MKPointAnnotation: \(annotation.title ?? "")")
            print("Se seleccionó un coordenadas: \(annotation.coordinate.latitude)")
            print("Se seleccionó un coordenadas: \(annotation.coordinate.longitude)")
        }
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.warning)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetalleZonaViewController") as! DetalleZonaViewController
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        vc.recibirZona = zonas[indexPath.row]
        present(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
}

