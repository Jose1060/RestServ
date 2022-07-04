//
//  PedidosViewController.swift
//  RestServ
//
//  Created by Mac 01 on 25/06/22.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class PedidosViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    //var pedidos:[AnyObject] = []
    
    var pedidos:[String] = []
    
    @IBOutlet weak var listaPedidos: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listaPedidos.dataSource = self
        listaPedidos.delegate = self
        
        let a = Database.database().reference().child("clientes").child(Auth.auth().currentUser!.uid).child("pedidos").observe(DataEventType.childAdded, with: {(snapshot) in
            print(snapshot)
            print("resultados")
            let pedido = (snapshot.value as! NSDictionary)["nombre"] as! String
            self.pedidos.append(pedido)
            self.listaPedidos.reloadData()
            })
        print(a)
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if pedidos.count == 0 {
            return 1
        }
        else {
            return pedidos.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = UITableViewCell()
        if pedidos.count == 0 {
            celda.textLabel?.text = "No se tiene ningun pedido"
        }
        else {
            let pedido = pedidos[indexPath.row]
            celda.textLabel?.text = "\(pedido)"
        }
        return celda
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
