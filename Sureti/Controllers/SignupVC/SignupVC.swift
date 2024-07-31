//
//  SignupVC.swift
//  Sureti
//
//  Created by Hamza's Mac on 21/09/2021.
//

import UIKit

class SignupVC: UIViewController {
    
    /* MARK:- Outlets and Properties */
    @IBOutlet weak var textField_FirstName   : UITextField!
    @IBOutlet weak var textField_LastName    : UITextField!
    @IBOutlet weak var textField_Email       : UITextField!
    @IBOutlet weak var textField_password    : UITextField!
    @IBOutlet weak var textField_ConfirmPass : UITextField!
    @IBOutlet weak var btnCreate             : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
    }
}

/* MARK:- Actions */
extension SignupVC{
    @IBAction func didTapCreate(_ sender: UIButton){
        print("Create Account Tapped")
        guard let firstName = textField_FirstName.text, firstName != "" else{
            showToast(message: "Please enter first name.")
            return
        }
        guard let lastName = textField_LastName.text, lastName != "" else{
            showToast(message: "Please enter last name.")
            return
        }
        guard let email = textField_Email.text, email != "" else{
            showToast(message: "Please enter email.")
            return
        }
        guard let password = textField_password.text, password != "" else{
            showToast(message: "Please enter password.")
            return
        }
        guard let confirmPass = textField_ConfirmPass.text, confirmPass != "" else{
            showToast(message: "Please confirm your password.")
            return
        }
        goToHome()
    }
    @IBAction func didTapBack(_ sender: UIButton){
        print("Back Tapped")
        self.dismiss(animated: false, completion: nil)
    }
}

/* MARK:- Extension */
extension SignupVC{
    func setupVC(){
        // UI Setup
        textField_FirstName  .layer.cornerRadius = 4.0
        textField_LastName   .layer.cornerRadius = 4.0
        textField_Email      .layer.cornerRadius = 4.0
        textField_password   .layer.cornerRadius = 4.0
        textField_ConfirmPass.layer.cornerRadius = 4.0
        textField_FirstName  .layer.borderWidth  = 1.0
        textField_LastName   .layer.borderWidth  = 1.0
        textField_Email      .layer.borderWidth  = 1.0
        textField_password   .layer.borderWidth  = 1.0
        textField_ConfirmPass.layer.borderWidth  = 1.0
        textField_FirstName  .layer.borderColor  = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        textField_LastName   .layer.borderColor  = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        textField_Email      .layer.borderColor  = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        textField_password   .layer.borderColor  = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        textField_ConfirmPass.layer.borderColor  = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        btnCreate.layer.cornerRadius = btnCreate.frame.size.height / 2
        
        textField_FirstName.attributedPlaceholder   = NSAttributedString(
            string: "First Name",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        textField_LastName.attributedPlaceholder    = NSAttributedString(
            string: "Last Name",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        textField_Email.attributedPlaceholder       = NSAttributedString(
            string: "Email",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        textField_password.attributedPlaceholder    = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        textField_ConfirmPass.attributedPlaceholder = NSAttributedString(
            string: "Confirm Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    }
    func goToHome(){
        let home = HomeVC(
            nibName: Constants.VCNibs.Home,
            bundle: nil)
        home.modalPresentationStyle = .fullScreen
        self.present(home, animated: false, completion: nil)
    }
}
