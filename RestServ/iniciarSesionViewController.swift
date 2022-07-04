//
//  iniciarSesionViewController.swift
//  RestServ
//
//  Created by Mac 01 on 25/06/22.
//

import UIKit
import FirebaseAuth

class iniciarSesionViewController: UIViewController {
    @IBOutlet weak var usuarioText: UITextField!
    @IBOutlet weak var claveText: UITextField!
    
    @IBAction func ingresarTapped(_ sender: Any) {
        Auth.auth().signIn(withEmail: usuarioText.text!, password: claveText.text!){
            (user, error) in
            print("Intentando iniciar sesion")
            if error != nil{
                print("Se presento el siguiente error: \(String(describing: error) )")
                let alerta = UIAlertController(title: "Usuario no existe", message: "\(String(describing: error))", preferredStyle: .alert)
                let btnOK = UIAlertAction(title: "Crear Usuario", style: .default, handler: {(UIAlertAction) in self.performSegue(withIdentifier: "registerSegue", sender: nil)})
                
                let btnCancelar = UIAlertAction(title: "Cancelar", style: .default, handler: nil)
                alerta.addAction(btnCancelar)
                alerta.addAction(btnOK)
                
                self.present(alerta, animated: true, completion: nil)
            }else{
                print("Inicio de sesion exitoso")
                self.performSegue(withIdentifier: "iniciarSesionSegue", sender: nil)
            }
        }    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
