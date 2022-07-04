//
//  RealizarPedidoViewController.swift
//  RestServ
//
//  Created by Mac 01 on 25/06/22.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class RealizarPedidoViewController: UIViewController {

    @IBOutlet weak var lblPedidoNombre: UILabel!
    @IBOutlet weak var lblPedidoPrecio: UILabel!
    @IBOutlet weak var lblPedidoTiempo: UILabel!
    
    var comida = Comida()
    var bebida = Bebida()
    var pedido = ""
    
    @IBAction func agregarPedido(_ sender: Any) {

        if pedido == "comida" {
            let pedido_agregado = ["nombre" : comida.Nombre, "precio" : comida.Precio, "tiempo": comida.Tiempo] as [String : Any]
            Database.database().reference().child("clientes").child(Auth.auth().currentUser!.uid).child("pedidos").childByAutoId().setValue(pedido_agregado)
        }
        if pedido == "bebida" {
            let pedido_agregado = ["nombre" : bebida.Nombre, "precio" : bebida.Precio, "stock": bebida.Stock] as [String : Any]
            Database.database().reference().child("clientes").child(Auth.auth().currentUser!.uid).child("pedidos").childByAutoId().setValue(pedido_agregado)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch pedido {
        case "comida":
            print("se recibio una comida")
            lblPedidoNombre.text = comida.Nombre
            lblPedidoPrecio.text = "S/.\(comida.Precio)"
            lblPedidoTiempo.text = "Tiempo estimado: \(comida.Tiempo) min"
        case "bebida":
            print("se recibio una bebida")
            lblPedidoNombre.text = bebida.Nombre
            lblPedidoPrecio.text = "S/.\(bebida.Precio)"
            lblPedidoTiempo.text = ""
        default:
            print("No se recibio ningun pedido")
        }
        
        
        // Do any additional setup after loading the view.
    }
            

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
