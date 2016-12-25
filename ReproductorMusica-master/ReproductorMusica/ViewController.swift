//
//  ViewController.swift
//  ReproductorMusica
//
//  Created by Walter Llano Suárez on 25/12/16.
//  Copyright © 2016 Walter Llano Suárez. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //-----------vars-------------------------------
    var reproductor: AVAudioPlayer!
    var volumenActual: Float = 30
    var canciones: [String: String] = ["01": "Luis Miguel - La media vuelta.", "02" : "Moby - Lift me up.", "03" : "Julieta Venegas - Me voy.", "04" : "Keane - Open your eyes", "05" : "Zoé - Poli Love"]
    //-------------functions------------------------
    func randomSong()->String{
            let randomIndex = Int(arc4random_uniform(UInt32(canciones.count)))
        
            let rowToSelect:IndexPath = IndexPath(row: randomIndex, section: 0);
            self.tableView.selectRow(at: rowToSelect, animated: true, scrollPosition: UITableViewScrollPosition.none);
        
            return "0\(randomIndex+1)"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return canciones.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        cell.nombre.text = canciones["0\((indexPath as NSIndexPath).row + 1)"]
        let rowToSelect:IndexPath = IndexPath(row: 0, section: 0);
        self.tableView.selectRow(at: rowToSelect, animated: true, scrollPosition: UITableViewScrollPosition.none);
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        seleccionarCancion(String("0\((indexPath as NSIndexPath).row + 1)"))
        reproductor.play()
    }
    
    

    
    //------------Sel Cancion------------------------
    func seleccionarCancion(_ cancion: String){
        let sonidoURL = Bundle.main.url(forResource: String(cancion), withExtension: "mp3")
        imagen.image = UIImage(named: "cover\(cancion).jpg")
        titulo.text = canciones[cancion]
        do{
            try reproductor = AVAudioPlayer(contentsOf: sonidoURL!)
            volumenActual = volume.value
            reproductor.volume = volumenActual
        } catch {
            print("Error al cargar el archivo de sonido")
        }
    }
    //-----------------Inicialización-----------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        let sonidoURL = Bundle.main.url(forResource: "01", withExtension: "mp3")
            imagen.image = UIImage(named: ("cover01.jpg"))
            titulo.text = canciones["01"]
        
        do{
            try reproductor = AVAudioPlayer(contentsOf: sonidoURL!)
            reproductor.volume = 0.3
        } catch {
            print("Error al cargar el archivo de sonido")
        }

    }

    //--------------Actions-----------------------
    
    
    @IBOutlet weak var tableView: UITableView!

    
    
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var btnReproducir: UIButton!
    
    
    @IBAction func detener() {
        if (reproductor.isPlaying){
            reproductor.stop()
            reproductor.currentTime = 0.0
        }
    }
    
    @IBAction func reproducir() {
        if (!reproductor.isPlaying){
            
            reproductor.play()
        }
    }
    
    @IBAction func shuffle() {
        if (reproductor.isPlaying){
            reproductor.stop()
        }
        seleccionarCancion(String(randomSong()))
        
       
        
        
        
        reproductor.play()
    }

    @IBAction func pausa() {
        if (reproductor.isPlaying){
            reproductor.pause()
        }
    }
    
    @IBOutlet weak var volume: UISlider!
    
    
    @IBAction func actionVolume(_ sender: AnyObject) {
        volumenActual = volume.value
        reproductor.volume = volumenActual
    }
    
}

