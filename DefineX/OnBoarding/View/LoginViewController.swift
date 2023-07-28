//
//  ViewController.swift
//  DefineX
//
//  Created by Yarkın Gazibaba on 26.07.2023.
//

import UIKit
import SkyFloatingLabelTextField
import SnapKit

class LoginViewController: UIViewController{
    let overcastBlueColor = UIColor(red: 0, green: 187/255, blue: 204/255, alpha: 1.0)
    let textFieldFrame = CGRect(x: 150, y: 10, width: 120, height: 45)
    
    let lightGreyColor = UIColor(red: 197/255, green: 205/255, blue: 205/255, alpha: 1.0)
    let darkGreyColor = UIColor(red: 52/255, green: 42/255, blue: 61/255, alpha: 1.0)
    
    let mailIcon = UIImage(named: "email_icon")
    let lockIcon = UIImage(named: "lock_icon")
    
    
    
    private let welcomeMessage: UILabel = {
        let label = UILabel()
        label.text = "Definex Case Study"
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        label.textAlignment = .center
        return label
    }()
    
    private let emailTextField: SkyFloatingLabelTextField = {
        let textField = SkyFloatingLabelTextField()
        textField.placeholder = "E-mail address"
        textField.title = "E-mail address".lowercased()
        textField.tag = 0
        textField.lineHeight = 1.0
        textField.selectedLineHeight = 2.0
        textField.rightViewMode = UITextField.ViewMode.always
        textField.autocapitalizationType = .none
        //textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        return textField
    }()
    
    private let passwordTextField: SkyFloatingLabelTextField = {
        let textField = SkyFloatingLabelTextField()
        textField.placeholder = "Password"
        textField.tag = 1
        textField.title = "Password"
        textField.lineHeight = 1.0
        textField.selectedLineHeight = 2.0
        textField.rightViewMode = UITextField.ViewMode.always
        textField.autocapitalizationType = .none
        //textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        return textField
    }()
    
    private let logInButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("LOGIN", for: .normal)
        btn.backgroundColor = .green
        btn.titleLabel?.textAlignment = .right
        btn.titleLabel?.font =  UIFont.systemFont(ofSize: 13, weight: .semibold)
        btn.layer.masksToBounds = true
        btn.setTitleColor(.black, for: .normal)
        btn.layer.cornerRadius = 6
        btn.addTarget(self, action: #selector(logIn_TUI), for: .touchUpInside)
        return btn
    }()
    
    private let facebookButton: UIButton = {
        let btn = UIButton()
        btn.layer.masksToBounds = true
        btn.setImage(UIImage(named: "facebook_button_image"), for: .normal)
        btn.layer.cornerRadius = 6
        //btn.addTarget(ViewController.self, action: #selector(comingSoon_TUI), for: .touchUpInside)
        return btn
    }()
    
    private let twitterButton: UIButton = {
        let btn = UIButton()
        btn.layer.masksToBounds = true
        btn.setImage(UIImage(named: "twitter_button_image"), for: .normal)
        btn.layer.cornerRadius = 6
        //btn.addTarget(ViewController.self, action: #selector(comingSoon_TUI), for: .touchUpInside)
        return btn
    }()
    
    private let forgotPasswordButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("I FORGOT MY PASS", for: .normal)
        btn.backgroundColor = .clear
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor(named: "app_blue")?.cgColor
        btn.titleLabel?.textAlignment = .center
        btn.titleLabel?.font =  UIFont.systemFont(ofSize: 10, weight: .medium)
        btn.layer.masksToBounds = true
        btn.setTitleColor(.black, for: .normal)
        btn.layer.cornerRadius = 6
        return btn
    }()
    
    private let leftDotImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"left_dot_image")
        return imageView
    }()
    
    private let rightDotImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"left_dot_image")
        return imageView
    }()
    
    let viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpViewModel()
        setUI()
    }
    
    override func viewDidLayoutSubviews() {
        let gradient = viewModel.getGradientLayer(bounds: welcomeMessage.bounds, colors: [UIColor(named: "app_dark_blue")!.cgColor, UIColor(named: "app_blue")!.cgColor])
       
        welcomeMessage.textColor = viewModel.gradientColor(bounds: welcomeMessage.bounds, gradientLayer: gradient, colors: [UIColor(named: "app_dark_blue")!.cgColor, UIColor(named: "app_blue")!.cgColor])
        
        logInButton.applyGradient(colors: [UIColor(named: "button_green_color2")!.cgColor, UIColor(named: "button_green_color1")!.cgColor], startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 1, y: 0))
    }
    
    
    
    func setUI() {
        view.addSubview(welcomeMessage)
        welcomeMessage.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(150)
            make.centerX.equalToSuperview()
            make.height.equalTo(78)
            make.width.equalTo(177)
        }
        
        view.addSubview(emailTextField)
        emailTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(welcomeMessage.snp.bottom).offset(70)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(45)
        }
        
        view.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(emailTextField.snp.bottom).offset(10)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(45)
        }
        
        view.addSubview(facebookButton)
        facebookButton.snp.makeConstraints { make in
            make.leading.equalTo(passwordTextField.snp.leading)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.height.equalTo(55)
            make.width.equalToSuperview().multipliedBy(0.4)
        }
        
        view.addSubview(twitterButton)
        twitterButton.snp.makeConstraints { make in
            make.trailing.equalTo(passwordTextField.snp.trailing)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.height.equalTo(55)
            make.width.equalToSuperview().multipliedBy(0.4)
        }
        
        view.addSubview(forgotPasswordButton)
        forgotPasswordButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(twitterButton.snp.height).multipliedBy(0.5)
            make.width.equalTo(twitterButton.snp.width).multipliedBy(0.8)
            make.bottom.equalTo(twitterButton.snp.top).offset(-24)
        }
        
        view.addSubview(leftDotImageView)
        leftDotImageView.snp.makeConstraints { make in
            make.trailing.equalTo(forgotPasswordButton.snp.leading)
            make.centerY.equalTo(forgotPasswordButton.snp.centerY)
            make.width.equalTo(50)
            make.height.equalTo(2)
        }
        
        view.addSubview(rightDotImageView)
        rightDotImageView.snp.makeConstraints { make in
            make.leading.equalTo(forgotPasswordButton.snp.trailing)
            make.centerY.equalTo(forgotPasswordButton.snp.centerY)
            make.width.equalTo(50)
            make.height.equalTo(2)
        }
                
        view.addSubview(logInButton)
        logInButton.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(45)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(forgotPasswordButton.snp.top).offset(-45)
        }
    }
    
    
    private func setUpViewModel(){
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        viewModel.setTextFieldProperties(emailTextField: emailTextField, passwordTextfield: passwordTextField)
        guard let mail_icon = mailIcon, let lock_icon = lockIcon else  {return}
        viewModel.setTextFieldsImages(emailIcon: mail_icon, lockIcon: lock_icon ,emailTextField: self.emailTextField, passwordTextfield: self.passwordTextField)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.tag == 0 {
            print("üstteki dokunuş geldi")
            emailTextField.tintColor = UIColor(named: "login_selectedColor")
        }
        else if textField.tag == 1 {
            print("alttaki dokunuş geldi")
            passwordTextField.tintColor = UIColor(named: "login_selectedColor")?.withAlphaComponent(1.0)
        }
        print("TextField did begin editing method called")
    }

    func textFieldDidEndEditing(_ textField: UITextField) {

        print("TextField did end editing method called\(textField.text)")
        if textField.tag == 0 {
            print("üstteki dokunuş bitti")
            if let text = emailTextField.text {
                if !text.contains("@"){
                    emailTextField.lineColor = .red
                }
                else{
                    emailTextField.lineView.applyGradient(colors: [UIColor(named: "button_green_color2")!.cgColor, UIColor(named: "button_green_color1")!.cgColor], startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 1, y: 0))
                }
            }
            emailTextField.tintColor = UIColor(named: "login_selectedColor")?.withAlphaComponent(0.4)
            
        }
        else if textField.tag == 1 {
            print("alttaki dokunuş bitti")
            
            passwordTextField.tintColor = UIColor(named: "login_selectedColor")
        }
    }

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {

        print("TextField should begin editing method called")
        return true;
    }

    func textFieldShouldClear(_ textField: UITextField) -> Bool {

        print("TextField should clear method called")
        return true;
    }

    private func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        print("TextField should end editing method called")
        return true;
    }


    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("While entering the characters this method gets called")
        return true;
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("TextField should return method called")
        textField.resignFirstResponder();
        return true;
    }
}

// MARK: - Router
extension LoginViewController {
   
    @objc private func logIn_TUI(){
        LoginRouter.startModule(navigationController: self.navigationController ?? UINavigationController(), viewController: TabBarController())
    }
    
    @objc private func comingSoon_TUI(){
        // alert bas
        print("alert bas")
    }
}

