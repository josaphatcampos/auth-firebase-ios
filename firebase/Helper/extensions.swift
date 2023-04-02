//
//  extensions.swift
//  firebase
//
//  Created by Josaphat Campos Pereira on 01/04/23.
//

import UIKit

extension UIView {
    func applyBlurEffect(){
        backgroundColor = .clear
        let blurEffect = UIBlurEffect(style: .extraLight)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.alpha = 0.7
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(blurEffectView, at:0)

    }
    
    func roundCorners(corners: CACornerMask, radius: CGFloat){
        clipsToBounds = true
        layer.cornerRadius = radius
        layer.maskedCorners = corners
    }
}

extension UIViewController{
    func dispatchAlert(_ title: String?, message: String, handler: @escaping()->Void = {}){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let dismissAction = UIAlertAction(title: "Fechar", style: .default) { (action)->Void in
            handler()
        }
        
        alert.addAction(dismissAction)
        self.present(alert, animated: true, completion: nil)
    }
}
