//
//  SingUpViewController.swift
//  firebase
//
//  Created by Josaphat Campos Pereira on 02/04/23.
//

import UIKit
import FirebaseAuth

protocol SingUpViewControllerDelegate: AnyObject{
    func didSingUpComplete()
}

class SingUpViewController: UIViewController {
    
    weak var delegate:SingUpViewControllerDelegate?
    
    @IBOutlet weak var formview: UIView!
    
    @IBOutlet weak var emailtextfield: UITextField!
    
    @IBOutlet weak var passwordtextfield: UITextField!
    
    @IBOutlet weak var cadastrarbutton: UIButton!
    
    @IBAction func cadastrarAction(_ sender: Any) {
        guard let email = emailtextfield.text, !email.isEmpty else{
            return
        }
        guard let password = passwordtextfield.text, !password.isEmpty else{
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password, completion: { [self] (user, error: Error?) in
        
            if let err = error{
                print("Erro:", err)
                print("E-mail:", email)
                
                self.dispatchAlert("Error", message: "\(err) com o e-mail \(email)")
                return
            }
            print("Sucesso userId:", user?.user.uid ?? "")
            self.delegate?.didSingUpComplete()
            self.dismiss(animated: true, completion: nil)
            
        
        })
    }
    
    @IBAction func login(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configurelayout()
    }
    
    func configurelayout(){
        formview.applyBlurEffect()
        formview.roundCorners(corners: [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner], radius: 30)
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
