//
//  ViewController.swift
//  Adventure Kaan
//
//  Created by Marco Alonso Rodriguez on 16/05/23.
//

import UIKit

class ZonasViewController: UIViewController {
    
    var zonas : [ZonasData] = [
        ZonasData(nombre: "Museo Maya", imagen: UIImage(named: "museomaya")!, latitud: 19.57744800, longitud: -88.045490, textoHistoria: "La que ahora es la cabecera del municipio Felipe Carrillo Puerto, en Quintana Roo, fue fundada el 15 de octubre de 1850 y se llamó, originalmente, en lengua maya Noj Kaaj Santa Cruz Xbáalam Naj, en español significa 'el gran pueblo Santa Cruz casa del jaguar', y así le dicen todavía los abuelos mayas. Este lugar fue considerado sagrado, es resultado del gran levantamiento maya, más conocido como la Guerra de Castas, que inició el 30 de julio de 1847. \n En esa conflagración peninsular inicialmente se enfrentaron blancos (tsulo’ob) contra mayas, a quienes luego se les unió gente de origen asiático, negros, mestizos e incluso blancos. El objetivo era acabar con el pago de las excesivas contribuciones y obvenciones eclesiásticas, contra la explotación que padecían y defender su territorio ante el crecimiento de las haciendas. Luego de iniciado el levantamiento, en poco tiempo se adueñó prácticamente de toda la península de Yucatán a excepción de las ciudades de Mérida y Campeche. Llegaron a las inmediaciones de la capital política y económica de la península, pero los mayas se retiraron, era tiempo de sembrar el santo maíz, nuestro principal alimento. El ejército yucateco pasó a la contraofensiva, los mayas decidieron replegarse y establecer su poder en esta región suroriental de la península.")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    
    @IBAction func aboutUsButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetalleZonaViewController") as! DetalleZonaViewController
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    
}

