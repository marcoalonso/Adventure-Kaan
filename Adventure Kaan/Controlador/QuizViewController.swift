//
//  QuizViewController.swift
//  Adventure Kaan
//
//  Created by Marco Alonso Rodriguez on 21/05/23.
//

import UIKit
import AVFoundation

class QuizViewController: UIViewController {
    
    
    @IBOutlet weak var alturaRespuestaConstraint: NSLayoutConstraint!
    @IBOutlet weak var backgroundRespuesta: UIView!
    @IBOutlet weak var respuestaLabel: UILabel!
    
    @IBOutlet weak var falsoButton: UIButton!
    @IBOutlet weak var verdaderoButton: UIButton!
    @IBOutlet weak var imagenPregunta: UIImageView!
    @IBOutlet weak var progresoQuizPregunta: UIProgressView!
    @IBOutlet weak var textoPregunta: UITextView!
    
    var quizManager = QuizManager()
    var audioPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        preparePlayer()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        resetQuizz()
    }
    
    private func mostrarInformacionPregunta(){
        ocultarRespuesta()
        textoPregunta.text = quizManager.obtenerTextoPregunta()
        imagenPregunta.image = quizManager.obtenerImagen()
        progresoQuizPregunta.progress = quizManager.obtenerProgreso()
    }
    
    private func preparePlayer(){
        guard let soundURL = Bundle.main.url(forResource: "alert", withExtension: "mp3") else {
            fatalError("Archivo de sonido no encontrado")
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
        } catch {
            print("Error al inicializar AVAudioPlayer: \(error)")
        }
    }
    
    func mostrarRespuesta(respCorrecta: Bool){
        
        UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveEaseInOut, animations: {
            self.backgroundRespuesta.alpha = 1
        }, completion: nil)
        
        if respCorrecta {
            backgroundRespuesta.backgroundColor = .green
            respuestaLabel.text = "Correcto"
        } else {
            backgroundRespuesta.backgroundColor = .red
            respuestaLabel.text = "Incorrecto"
        }
    }
    
    func ocultarRespuesta(){
        UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveLinear, animations: {
            self.backgroundRespuesta.alpha = 0
        }, completion: nil)
    }
    
    @IBAction func respuestaUsuarioButton(_ sender: UIButton) {
        disableButtons()
        let respuestaUsuario = sender.titleLabel!.text!
        let respuestaCorrecta = quizManager.revisarRespuesta(respuestaUsuario: respuestaUsuario)
        
        if respuestaCorrecta {
            audioPlayer?.play()
            sender.backgroundColor = UIColor.green
            self.mostrarRespuesta(respCorrecta: true)
            
            
        } else {
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.warning)
            
            sender.backgroundColor = UIColor.red
            self.mostrarRespuesta(respCorrecta: false)
            
            
            
        }
        
        //Siguiente pregunta
        if quizManager.siguientePregunta() {
            _ = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(cambiarPregunta), userInfo: nil, repeats: false)
            
        } else {
            
            let alerta = UIAlertController(title: "Fin del quiz", message: "Quieres intentar de nuevo?", preferredStyle: .alert)
            let accionAceptar = UIAlertAction(title: "Si", style: .default) { _ in
                
                self.resetQuizz()
            }
            let cancelar = UIAlertAction(title: "No", style: .default) { _ in
                
            }
            alerta.addAction(accionAceptar)
            alerta.addAction(cancelar)
            present(alerta, animated: true)
            
        }
    }
    
    private func resetQuizz(){
        quizManager.numeroPregunta = 0
        mostrarInformacionPregunta()
        resetButtons()
        enableButtons()
        ocultarRespuesta()
    }
    
    @objc func cambiarPregunta(){
        enableButtons()
        mostrarInformacionPregunta()
        resetButtons()
    }
    
    private func resetButtons(){
        verdaderoButton.backgroundColor = UIColor.white
        falsoButton.backgroundColor = UIColor.white
    }
    
    private func disableButtons(){
        falsoButton.isUserInteractionEnabled = false
        verdaderoButton.isUserInteractionEnabled = false
    }
    
    private func enableButtons(){
        falsoButton.isUserInteractionEnabled = true
        verdaderoButton.isUserInteractionEnabled = true
    }
    
    
}
