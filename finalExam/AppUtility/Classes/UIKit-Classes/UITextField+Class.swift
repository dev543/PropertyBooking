//
//  UITextField+Class.swift
//  MVVMBasicStructure
//
//  Created by KISHAN_RAJA on 22/09/20.
//  Copyright © 2020 KISHAN_RAJA. All rights reserved.
//

import UIKit

class ThemeTextField: TextFieldPedding {
    private var padding: UIEdgeInsets = UIEdgeInsets()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        padding = UIEdgeInsets(top: 16, left: 20, bottom: 16, right: 20)
     
        self.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.font = UIFont.customFont(ofType: .medium, withSize: 16)
//        self.placeHolderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.backgroundColor = #colorLiteral(red: 0.959256351, green: 0.959256351, blue: 0.959256351, alpha: 1)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
            self.layer.cornerRadius = self.frame.height / 2
        })
    }
}

class TextFieldPedding: UITextField {
    @IBInspectable var leftPadding : CGFloat = 20
    @IBInspectable var rightPadding : CGFloat = 20
    
    private var padding: UIEdgeInsets = UIEdgeInsets()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if Bundle.main.isArabicLanguage {
            padding = UIEdgeInsets(top: 0, left: rightPadding, bottom: 0, right: leftPadding)
        } else {
            padding = UIEdgeInsets(top: 0, left: leftPadding, bottom: 0, right: rightPadding)
        }
    }

  
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.width - 30, y: 0, width: 20 , height: bounds.height)
    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: 10, y: 0, width: 20 , height: bounds.height)
    }
}

class PhoneCodeTextField: TextFieldPedding {
    private var padding: UIEdgeInsets = UIEdgeInsets()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        padding = UIEdgeInsets(top: 16, left: 20, bottom: 16, right: 0)
     
        self.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.font = UIFont.customFont(ofType: .medium, withSize: 16)
        self.placeHolderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.backgroundColor = #colorLiteral(red: 0.959256351, green: 0.959256351, blue: 0.959256351, alpha: 1)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
//            self.layer.cornerRadius = self.frame.height / 2
        })
    }
}

class PhoneCodeTextFieldPedding: UITextField {
    @IBInspectable var leftPadding : CGFloat = 20
    @IBInspectable var rightPadding : CGFloat = 0
    
    private var padding: UIEdgeInsets = UIEdgeInsets()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if Bundle.main.isArabicLanguage {
            padding = UIEdgeInsets(top: 0, left: rightPadding, bottom: 0, right: leftPadding)
        } else {
            padding = UIEdgeInsets(top: 0, left: leftPadding, bottom: 0, right: rightPadding)
        }
    }

  
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.width - 30, y: 0, width: 0 , height: bounds.height)
    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: 10, y: 0, width: 20 , height: bounds.height)
    }
}

//dont select action in textfield
class RestrictionTextField: UITextField {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.autocorrectionType = .no
    }
    override func selectionRects(for range: UITextRange) -> [UITextSelectionRect] {
        return []
    }
    //    override func caretRect(for position: UITextPosition) -> CGRect {
    //        return CGRect.zero
    //    }
    
    override func closestPosition(to point: CGPoint) -> UITextPosition? {
        let beginning = self.beginningOfDocument
        let end = self.position(from: beginning, offset: self.text?.count ?? 0)
        return end
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(UIResponderStandardEditActions.copy(_:)) || action == #selector(UIResponderStandardEditActions.select(_:)) || action == #selector(UIResponderStandardEditActions.cut(_:)) || action == #selector(UIResponderStandardEditActions.paste(_:)) || action == #selector(UIResponderStandardEditActions.selectAll(_:)){
            return false
        }
        else {
            return super.canPerformAction(action, withSender: sender)
        }
    }
}

class OTPTextField: UITextField {
    //    let padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.borderColor(color: #colorLiteral(red: 0.8823529412, green: 0.8823529412, blue: 0.8823529412, alpha: 1), borderWidth: 1.0)
        self.borderStyle = .none
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
            self.layer.cornerRadius = self.frame.height / 2
        })
        self.keyboardType = .asciiCapableNumberPad
        self.isSecureTextEntry = false
        self.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.backGroundColor(color: .whiteBg)
        self.font =  UIFont.customFont(ofType: .semiBold, withSize: 18)
        self.textAlignment = .center
        self.placeholder = "\u{2022}"
        self.delegate = self
        self.addTarget(self, action: #selector(textfieldIsEditing(_:)), for: .editingChanged)
        self.addTarget(self, action: #selector(textfieldIsEditing(_:)), for: .editingChanged)
    }
    //
    //    override open func textRect(forBounds bounds: CGRect) -> CGRect {
    //        return bounds.inset(by: padding)
    //    }
    //
    //    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
    //        return bounds.inset(by: padding)
    //    }
    //
    //    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
    //        return bounds.inset(by: padding)
    //    }
    
    override func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("--------------------------------")
        if string.isEmpty {
            return true
        }
        if textField.text?.count == 1{
            textField.text = ""
            return true && string.isValid(.number)
        }
        print("--------------------------------")
        return true && string.isValid(.number)
    }
    
    @objc func textfieldIsEditing(_ textField:UITextField){
        if !textField.text!.isEmpty{
            if IQKeyboardManager.shared.canGoNext{
                IQKeyboardManager.shared.goNext()
            } else {
                self.resignFirstResponder()
            }
        }
    }
    override func deleteBackward() {
        super.deleteBackward()
        if IQKeyboardManager.shared.canGoPrevious{
            IQKeyboardManager.shared.goPrevious()
        }
    }
}
