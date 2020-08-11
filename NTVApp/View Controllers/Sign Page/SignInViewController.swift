//
//  SignInViewController.swift
//  UITableviewBasic
//
//  Created by TURGUT on 1.05.2020.
//  Copyright © 2020 Turgut. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth


class SignInViewController: UIViewController {
    
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.isSecureTextEntry = true
        
        
        
        
    }
    
    
    
    
    
    func showAlert(title: String, message: String) {
        // title ve message parametrerelerini kullanarak bir UIAlertController objesi oluşturur
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // "Done" adında bir aksiyon oluşturulur
        let doneAction = UIAlertAction(title: "Done", style: .default, handler: nil)
        
        // Oluşturulan aksiyon Alert'e eklenir.
        alert.addAction(doneAction)
        
        // Oluşturulan Alert'in ekranda gösterilmesi
        present(alert, animated: true, completion: nil)
       
    }
    
    
    
    
    @IBAction func loginTapped(_ sender: Any) {
        // Kullanıcının girdiği e-posta adresi
        let email = emailTextField.text!
        
        // Kullanıcının girdiği şifre
        let password = passwordTextField.text!
        
        
        // Firebase'in hazır "signIn" fonksiyonunu kullanıcıdan aldığımız e-posta ve şifre ile çalıştırıyoruz.
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if self.emailTextField.text == "" && self.passwordTextField.text == ""  {
                
                self.showAlert(title: "Uyarı", message: "Tüm alanları doldurun")
                
            }
            else if error == nil && result != nil {
                // Login işlemi sırasında bir hata meydana gelmedi ve sonuç bize ulaştı.
                // Bir Alert ile kullanıcıyı giriş işleminin başarılı olduğuna dair bilgilendirir.
                
                self.transitionToHome()
                
                
            }else {
                // Login işlemi esnasında bir hata meydana geldi.
                // Bir Switch ile gelen hatanın koduna bakarak ne tür bir hata olduğunu anlıyoruz.
                switch (error! as NSError).code {
                case 17011:
                    // Hata Türü: Kullanıcı bulunamadı
                    // Ekranda Alert gösterir
                    self.showAlert(title: "Kullanıcı Bulunamadı", message: "E-posta adresinizi ve şifrenizi kontrol edin.")
                    
                case 17009:
                    // Hata Türü: Hatalı Şifre
                    // Ekranda Alert gösterir
                    self.showAlert(title: "Hatalı Şifre", message: "Şifrenizi doğru girdiğinizden emin olun.")
                    
                default:
                    // Hata Türü: Bilinmeyen bir hata
                    // Ekranda Alert gösterir
                    self.showAlert(title: "Bilinmeyen Hata :(", message: "")
                }
            }
        }
       
    }
    
    
    func transitionToHome() {
        
        let myTabBarController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.myTabBarController) as? MyTabBarController
        
        view.window?.rootViewController = myTabBarController
        view.window?.makeKeyAndVisible()
        
    }
    
    
}




