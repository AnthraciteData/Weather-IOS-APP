//
//  UIApplication+Extension.swift
//  RealWeatherAPP
//
//  Created by AceDarkKronik on 9/9/21.
//

import UIKit

extension UIApplication{
    func endEditing()  {
        sendAction(#selector(UIResponder.resignFirstResponder) , to: nil, from: nil, for: nil)
    }
}
