//
//  SigninVC.swift
//  Sureti
//
//  Created by Hamza's Mac on 21/09/2021.
//

import UIKit
import SwiftyJSON

class SigninVC: UIViewController {
    
    /* MARK:- Outlets and Properties */
    @IBOutlet weak var viewAccount        : UIView!
    @IBOutlet weak var textField_Password : UITextField!
    @IBOutlet weak var lbl_forgot         : UILabel!
    @IBOutlet weak var btn_Signin         : UIButton!
    
    var email    = ""
    var password = ""
    var user     : UserModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
    }
}

/* MARK:- Actions */
extension SigninVC{
    @IBAction func didTapBack(_ sender : UIButton){
        print("Back Tapped")
        self.dismiss(animated: false, completion: nil)
    }
    @IBAction func didTapSignin(_ sender : UIButton){
        print("Sign in Tapped")
        guard let pass = textField_Password.text, pass != "" else{
            showToast(message: "Please enter password.")
            return
        }
        password = pass
        checkLogin()
    }
}

/* MARK:- Api methods */
extension SigninVC{
    func checkLogin(){
        self.showSpinner(onView: self.view, indicatorColor: .black)
        var param : [String : Any] = [:]
        param["email"]    = email
        param["password"] = password
        NetworkManager.sharedInstance.checkLogin(param: param){
            (respons) in
            switch respons.result{
            case .success(_):
                self.removeSpinner()
                do {
                    let apiData = try JSON(data: respons.data!)
                    Helper.debugLogs(any: apiData)
                    print(apiData)
                    if respons.response?.statusCode == 200 {
                        let message = apiData["message"]
                        if message == "Incorrect email ID or password."{
                            self.showToast(message: message.stringValue)
                        }
                        else if message == ""{
                            print("API hit success")
                            let userObj = apiData["data"]
                            self.user = UserModel(json: userObj)
                            self.goToHome()
                        }
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
extension SigninVC{
    func setupVC(){
        // UI Setup
        viewAccount       .layer.cornerRadius = 10.0
        textField_Password.layer.cornerRadius = 4.0
        textField_Password.layer.borderWidth  = 1.0
        textField_Password.layer.borderColor  = #colorLiteral(red: 0.3764705882, green: 0.2823529412, blue: 0.4705882353, alpha: 1)
        btn_Signin.layer.cornerRadius = btn_Signin.frame.size.height / 2
        
        textField_Password.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(
                            red: 0.3764705882,
                            green: 0.2823529412,
                            blue: 0.4705882353,
                            alpha: 1)])
    }
    func goToHome(){
        let home = HomeVC(
            nibName: Constants.VCNibs.Home,
            bundle: nil)
        home.modalPresentationStyle = .fullScreen
        self.present(home, animated: false, completion: nil)
    }
}
