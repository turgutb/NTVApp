//
//  SignUpViewController.swift
//  UITableviewBasic
//
//  Created by TURGUT on 1.05.2020.
//  Copyright © 2020 Turgut. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth


class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var signUpTapped: UIView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordTextField.isSecureTextEntry = true
        
        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    @IBAction func signUpTapped(_ sender: Any) {
        // Kullanıcının girdiği e-posta adresi
        let email = emailTextField.text!
        
        // Kullanıcının girdiği şifre
        let password = passwordTextField.text!
        
        // Firebase'in hazır "createUser" fonksiyonunu kullanıcıdan aldığımız e-posta ve şifre ile çalıştırıyoruz.
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if self.emailTextField.text == "" && self.passwordTextField.text != nil  {
                
                self.showAlert(title: "Uyarı", message: "Tüm alanları doldurun")
                
            }
            else if error == nil && result?.user != nil {
                // Sign Up işlemi sırasında bir hata meydana gelmedi ve sonuç bize ulaştı.
                // Bir Alert ile kullanıcıyı giriş işleminin başarılı olduğuna dair bilgilendirir.
                self.showAlert(title: "Kayıt Tamamlandı", message: "Merhaba, uygulamamıza hoşgeldiniz.")
                self.transitionToHome()
                
            }else {
                // Login işlemi esnasında bir hata meydana geldi.
                // Bir Switch ile gelen hatanın koduna bakarak ne tür bir hata olduğunu anlıyoruz.
                switch (error! as NSError).code {
                case 17007:
                    // Hata Türü: Kullanımda olan bir e-posta adresi
                    // Ekranda Alert gösterir
                    self.showAlert(title: "Bu E-posta Adresi Kayıtlı", message: "Bu E-posta adresi ile daha önce bir kayıt oluşturuldu.")
                    
                case 17026:
                    // Hata Türü: Şifre minimum karakter hatası
                    // Ekranda Alert gösterir
                    self.showAlert(title: "Hatalı Şifre", message: "Şifrenizin en az 6 karakterden oluştuğuna emin olun.")
                    
                case 17008:
                    // Hata Türü: Hatalı E-posta adresi
                    // Ekranda Alert gösterir
                    self.showAlert(title: "Hatalı E-posta Adresi", message: "E-posta adresinizin doğru formatta olduğundan emin olun.")
                    
                default:
                    // Hata Türü: Bilinmeyen bir hata...
                    // Ekranda Alert gösterir
                    self.showAlert(title: "Bilinmeyen Hata :(", message: "")
                }
            }
            
            
            
        }
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
    
    
    func isPasswordValid(_ password : String) -> Bool?  {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "[A-Za-z\\d!.@#$%^&*_]{8,}")
        
        return passwordTest.evaluate(with: password)
        
    }
    
    func transitionToHome() {
        
        let myTabBarController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.myTabBarController) as? MyTabBarController
        
        view.window?.rootViewController = myTabBarController
        view.window?.makeKeyAndVisible()
        
    }
    
    
    
    
    
    
}
