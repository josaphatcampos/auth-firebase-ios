//
//  ViewController.swift
//  firebase
//
//  Created by Josaphat Campos Pereira on 01/04/23.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    @IBOutlet weak var bgimage: UIImageView!
    
    @IBOutlet weak var formview: UIView!
    
    @IBOutlet weak var userinput: UITextField!
    
    @IBOutlet weak var passwordinput: UITextField!
    
    @IBOutlet weak var loginbutton: UIButton!
    
    @IBAction func loginbuttonaction(_ sender: Any) {
        if validateTextField(){
            guard let email = userinput.text, !email.isEmpty else{
                return
            }
            guard let password = passwordinput.text, !password.isEmpty else{
                return
            }
            
            Auth.auth().signIn(withEmail: email, password: password) { [self] (user, error) in
                if error != nil{
                    dispatchAlert(nil, message: "Falha ao logar")
                }
                
                completeLogin()
            }
        }else{
            dispatchAlert(nil, message: "Você não preencheu os campos corretamente.")
        }
    }
    
    @IBAction func cadastrarAction(_ sender: Any) {
        let singUpController = self.storyboard?.instantiateViewController(withIdentifier: "singUpViewController") as! SingUpViewController
        singUpController.delegate = self
        print("chamou cadastrar")
        self.present(singUpController, animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurelayout()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if Auth.auth().currentUser != nil {
            self.completeLogin()
        }
    }
    
    func configurelayout(){
        formview.applyBlurEffect()
        formview.roundCorners(corners: [.layerMinXMinYCorner, .layerMaxXMinYCorner], radius: 30)
    }
    
    func completeLogin(){
        DispatchQueue.main.async {
            let controller = self.storyboard?.instantiateViewController(withIdentifier: "mainnavigationcontroller") as! UINavigationController
            self.present(controller, animated: true, completion: nil)
        }
    }

    func validateTextField() -> Bool{
        return !(userinput.text?.isEmpty ?? true) && !(passwordinput.text?.isEmpty ?? true)
    }
}

extension ViewController: SingUpViewControllerDelegate{
    func didSingUpComplete() {
        completeLogin()
    }
    
    
}

