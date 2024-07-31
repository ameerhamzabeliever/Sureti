//
//  UIVCExtension.swift
//  Sureti
//
//  Created by Hamza's Mac on 22/09/2021.
//

import UIKit

extension UIViewController{
    func showSpinner(
        onView          : UIView,
        identifier      : String  = "Default",
        title           : String  = ""       ,
        backgroundColor : UIColor = .clear   ,
        indicatorColor  : UIColor = .white   ,
        textColor       : UIColor = .white
    ) {
        let spinnerView = UIView.init(
            frame: onView.bounds
        )
        spinnerView.backgroundColor = backgroundColor
        var activityIndicator = UIActivityIndicatorView()
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = indicatorColor
        activityIndicator.startAnimating()
        activityIndicator.center = spinnerView.center
        let lableY = activityIndicator.frame.origin.y + activityIndicator.frame.size.height
        let lableWidth = spinnerView.frame.width
        let label = UILabel(
            frame: CGRect(
                x      : 0.0       ,
                y      : lableY    ,
                width  : lableWidth,
                height : 40
            )
        )
        label.textColor     = textColor
        label.text          = title
        label.textAlignment = .center
        label.font          = UIFont(name: "Avenir Next Bold", size: 14.0)
        DispatchQueue.main.async {
            spinnerView.addSubview(label)
            spinnerView.addSubview(activityIndicator)
            onView.addSubview(spinnerView)
        }
        spinnerView.accessibilityIdentifier = identifier
        SPINNERS.append(spinnerView)
    }
    func removeSpinner(identifier: String = "Default") {
        DispatchQueue.main.async {
            for (index, spinner) in SPINNERS.enumerated() {
                if spinner.accessibilityIdentifier == identifier {
                    spinner.removeFromSuperview()
                    if SPINNERS.indices.contains(index){
                        SPINNERS.remove(at: index)
                    }
                }
            }
        }
    }
    func showToast(message : String) {
        DispatchQueue.main.async {
            var toastLabel = UILabel()
            toastLabel = UILabel(frame: CGRect(x: 0 , y: self.view.bounds.height - 40, width: self.view.bounds.width, height: 30 ))
            toastLabel.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            toastLabel.textColor = #colorLiteral(red: 0.2588235294, green: 0.2588235294, blue: 0.2588235294, alpha: 1)
            toastLabel.textAlignment = .center;
            toastLabel.text = message
            toastLabel.alpha = 1.0
            toastLabel.clipsToBounds  =  true
            self.view.addSubview(toastLabel)
            UIView.animate(withDuration: 2.0, delay: 3.0, options: .curveEaseOut, animations: {
                toastLabel.alpha = 0.0
            }, completion: {(isCompleted) in
                toastLabel.removeFromSuperview()
            })
        }
    }
}
