//
//  ProfileEditingViewController.swift
//  NTVApp
//
//  Created by TURGUT on 19.07.2020.
//  Copyright © 2020 Turgut. All rights reserved.
//
import UIKit
import FirebaseAuth
import FirebaseDatabase

class ProfileEditingViewController: UIViewController {
    // MARK: - UI Elements
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userLastNameTextField: UITextField!
    @IBOutlet weak var userInterestsTextField: UITextField!
    
    // MARK: - Stored Properties
    
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    // MARK: - Functions
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoBackToProfileViewController" {
            let destination = segue.destination as! ProfileViewController
            destination.userName = userNameTextField.text!
            destination.userLastName = userLastNameTextField.text!
            destination.userInterests = userInterestsTextField.text!
            destination.userImage = profileImageView.image
            
        }
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let actionSignOut = UIAlertAction(title: "Çıkış Yap", style: .default) { (UIAlertAction) in
            do {
                if Auth.auth().currentUser != nil {
                    try Auth.auth().signOut()
                    if let storyboard = self.storyboard {
                        let vc = storyboard.instantiateViewController(withIdentifier: "firstNavigationController") as! UINavigationController
                        self.present(vc, animated: false, completion: nil)
                    }
                } else {
                    print("Giriş yokki çıkalım")
                }
            } catch let signOutError as NSError {
                print ("Error signing out: \(signOutError)")
            }
            
        }
        
        alert.addAction(actionCancel)
        alert.addAction(actionSignOut)
        present(alert, animated: true, completion: nil)
    }
    
    func createImagePickerController(sourceType: UIImagePickerController.SourceType) -> UIImagePickerController {
        // Create an imagepicker object
        let imagePickerController = UIImagePickerController()
        
        // Select a sourcetype in image picking alternatives
        imagePickerController.sourceType = sourceType
        
        // Is photo editing enabled or not
        imagePickerController.allowsEditing = true
        
        // Configure the delegate of imagepicking function
        imagePickerController.delegate = self
        
        return imagePickerController
    }
    
    @IBAction func takePhotoFromLibrary(_ sender: Any) {
        let imagepicker = createImagePickerController(sourceType: .photoLibrary)
        present(imagepicker, animated: true, completion: nil)
    }
    
    // MARK: - Actions
  
    @IBAction func saveProfileButtonTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: "Profil Güncelleme", message: "Profil bilgileriniz başarı ile güncellenmiştir", preferredStyle: .alert)
        let action = UIAlertAction(title: "Profil sayfasına dön", style: .cancel) { (UIAlertAction) in
            self.performSegue(withIdentifier: "GoBackToProfileViewController", sender: nil)
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    
    @IBAction func logOutButtonTapped(_ sender: UIButton) {
        showAlert(title: "Çıkış yapmak üzeresiniz", message: "Eminmisiniz?")
    }
    
    
}

extension ProfileEditingViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // info, details about photo picking
        // 'UIImagePickerController.InfoKey' to reach all values
        let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        
        // 'imageView' update of the UI image view with the selected image from UIImagePicker
        profileImageView.image = image
        
        // Dismiss of the view after all actions completed.
        dismiss(animated: true, completion: nil)
    }
    
    
    
}

