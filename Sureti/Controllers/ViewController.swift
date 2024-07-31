//
//  ViewController.swift
//  Sureti
//
//  Created by Hamza's Mac on 21/09/2021.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {
    
    /* MARK:- Outlets and Properties */
    @IBOutlet weak var viewAccount     : UIView!
    @IBOutlet weak var lblSignin       : UILabel!
    @IBOutlet weak var lblCreateAcc    : UILabel!
    @IBOutlet weak var textField_Email : UITextField!
    @IBOutlet weak var btnNext         : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
        setupSignupTap()
    }
}

/* MARK:- Actions */
extension ViewController{
    @IBAction func didTapNext(_ sender: UIButton){
        print("Next Tapped")
        guard let email = textField_Email.text, email != "" else{
            showToast(message: "Please enter email.")
            return
        }
        checkEmail(check_Email: email)
    }
}

/* MARK:- Apis */
extension ViewController{
    func checkEmail(check_Email: String){
        self.showSpinner(onView: self.view, indicatorColor: .black)
        let param = ["email" : check_Email]
        NetworkManager.sharedInstance.checkEmail(param: param){
            (respons) in
            switch respons.result{
            case .success(_):
                self.removeSpinner()
                do {
                    let apiData = try JSON(data: respons.data!)
                    Helper.debugLogs(any: apiData)
                    if respons.response?.statusCode == 200 {
                        let message = apiData["message"]
                        if message == "User Not Found."{
                            self.showToast(message: message.stringValue)
                        }
                        else if message == "User Found."{
                            self.goToSignIn()
                        }
                    }
                    else{
                        print("Error")
                    }
                }
                catch{
                    print(error.localizedDescription)
                }
            case .failure(_):
                self.removeSpinner()
                print("Something went wrong")
            }
        }
    }
}

/* MARK:- Extension */
extension ViewController{
    func setupVC(){
        // UI Setup
        viewAccount    .layer.cornerRadius = 10.0
        btnNext        .layer.cornerRadius = btnNext.frame.size.height / 2
        textField_Email.layer.borderWidth  = 1.0
        textField_Email.layer.borderColor  = #colorLiteral(red: 0.3764705882, green: 0.2823529412, blue: 0.4705882353, alpha: 1)
        textField_Email.layer.cornerRadius = 4.0
        
        textField_Email.attributedPlaceholder = NSAttributedString(
            string: "Email",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(
                            red: 0.3764705882,
                            green: 0.2823529412,
                            blue: 0.4705882353,
                            alpha: 1)])
    }
    func goToSignIn(){
        let sign_in = SigninVC(
            nibName: Constants.VCNibs.SIGN_IN,
            bundle: nil)
        sign_in.email = textField_Email.text!
        sign_in.modalPresentationStyle = .fullScreen
        self.present(sign_in, animated: false, completion: nil)
    }
    func goToSignUp(){
        let sign_up = SignupVC(
            nibName: Constants.VCNibs.SIGN_UP,
            bundle: nil)
        sign_up.modalPresentationStyle = .fullScreen
        self.present(sign_up, animated: false, completion: nil)
    }
    @objc func lblSignupTapped(_ sender: UITapGestureRecognizer) {
        print("signup label Tapped")
        goToSignUp()
    }
    func setupSignupTap() {
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.lblSignupTapped(_:)))
        self.lblCreateAcc.isUserInteractionEnabled = true
        self.lblCreateAcc.addGestureRecognizer(labelTap)
    }
}
