//
//  ViewController.swift
//  DefineX
//
//  Created by Yarkın Gazibaba on 26.07.2023.
//

import UIKit
import SkyFloatingLabelTextField
import SnapKit

class LoginViewController: UIViewController {
    let overcastBlueColor = UIColor(red: 0, green: 187/255, blue: 204/255, alpha: 1.0)
    let textFieldFrame = CGRect(x: 150, y: 10, width: 120, height: 45)

    let lightGreyColor = UIColor(red: 197/255, green: 205/255, blue: 205/255, alpha: 1.0)
    let darkGreyColor = UIColor(red: 52/255, green: 42/255, blue: 61/255, alpha: 1.0)

    let mailIcon = Asset.emailIcon
    let lockIcon = Asset.lockIcon

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
        textField.placeholder = LocalizationKeys.emailPlaceholderTitle
        textField.title = LocalizationKeys.emailInfoTitle
        textField.tag = 0
        textField.lineHeight = 1.0
        textField.selectedLineHeight = 2.0
        textField.rightViewMode = UITextField.ViewMode.always
        textField.autocapitalizationType = .none
        // textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        return textField
    }()

    private let passwordTextField: SkyFloatingLabelTextField = {
        let textField = SkyFloatingLabelTextField()
        textField.placeholder = LocalizationKeys.passwordPlaceholderTitle
        textField.tag = 1
        textField.title = LocalizationKeys.passwordPlaceholderTitle
        textField.lineHeight = 1.0
        textField.selectedLineHeight = 2.0
        textField.rightViewMode = UITextField.ViewMode.always
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        return textField
    }()

    private let logInButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle(LocalizationKeys.loginButtonTitle, for: .normal)
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
        btn.setImage(Asset.facebookButtonImage.image, for: .normal)
        btn.layer.cornerRadius = 6
        btn.addTarget(self, action: #selector(comingSoonEvents), for: .touchUpInside)
        return btn
    }()

    private let twitterButton: UIButton = {
        let btn = UIButton()
        btn.layer.masksToBounds = true
        btn.setImage(Asset.twitterButtonImage.image, for: .normal)
        btn.layer.cornerRadius = 6
        btn.addTarget(self, action: #selector(comingSoonEvents), for: .touchUpInside)
        return btn
    }()

    private let forgotPasswordButton: UIButton = {
        let btn = UIButton()
        btn.setTitle(LocalizationKeys.forgotPassButtonTitle, for: .normal)
        btn.backgroundColor = .clear
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor(named: "app_blue")?.cgColor
        btn.titleLabel?.textAlignment = .center
        btn.titleLabel?.font =  UIFont.systemFont(ofSize: 10, weight: .medium)
        btn.layer.masksToBounds = true
        btn.setTitleColor(.black, for: .normal)
        btn.layer.cornerRadius = 6
        btn.addTarget(self, action: #selector(comingSoonEvents), for: .touchUpInside)
        return btn
    }()

    private let leftDotImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Asset.leftDotImage.image
        return imageView
    }()

    private let rightDotImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Asset.leftDotImage.image
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
        let gradient = viewModel.getGradientLayer(bounds: welcomeMessage.bounds, colors: [Asset.appDarkBlue.color.cgColor, Asset.appBlue.color.cgColor])

        welcomeMessage.textColor = viewModel.gradientColor(bounds: welcomeMessage.bounds, gradientLayer: gradient, colors: [Asset.appDarkBlue.color.cgColor, Asset.appBlue.color.cgColor])

        logInButton.applyGradient(colors: [Asset.buttonGreenColor2.color.cgColor, Asset.buttonGreenColor1.color.cgColor], startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 1, y: 0))
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

    private func setUpViewModel() {
        emailTextField.delegate = self
        passwordTextField.delegate = self

        viewModel.setTextFieldProperties(emailTextField: emailTextField, passwordTextfield: passwordTextField)
        viewModel.setTextFieldsImages(emailIcon: Asset.emailIcon.image, lockIcon: Asset.lockIcon.image, emailTextField: self.emailTextField, passwordTextfield: self.passwordTextField)
    }
    
    @objc func comingSoonEvents() {
        Alert.warning(title: LocalizationKeys.generalComingSoonTitle, text: LocalizationKeys.generalComingSoonTitle)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.tag == 0 {
            print(textField.text)
            print("üstteki dokunuş geldi")
            emailTextField.tintColor = Asset.loginSelectedColor.color
        } else if textField.tag == 1 {
            print("alttaki dokunuş geldi")
            passwordTextField.tintColor = Asset.loginSelectedColor.color.withAlphaComponent(1.0)
        }
        print("TextField did begin editing method called")
    }

    func textFieldDidEndEditing(_ textField: UITextField) {

        print("TextField did end editing method called\(textField.text)")
        if textField.tag == 0 {
            print("üstteki dokunuş bitti")
            if let text = emailTextField.text {
                if !text.contains("@") {
                    emailTextField.lineColor = .red
                } else {
                    emailTextField.lineView.applyGradient(colors: [Asset.buttonGreenColor2.color.cgColor, Asset.buttonGreenColor1.color.cgColor], startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 1, y: 0))
                }
            }
            emailTextField.tintColor = Asset.loginSelectedColor.color.withAlphaComponent(0.4)

        } else if textField.tag == 1 {
            print("alttaki dokunuş bitti")

            passwordTextField.tintColor = Asset.loginSelectedColor.color
        }
    }

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {

        print("TextField should begin editing method called")
        return true
    }

    func textFieldShouldClear(_ textField: UITextField) -> Bool {

        print("TextField should clear method called")
        return true
    }

    private func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        print("TextField should end editing method called")
        return true
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("While entering the characters this method gets called")
        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("TextField should return method called")
        textField.resignFirstResponder()
        return true
    }
}

// MARK: - Router
extension LoginViewController {

    @objc private func logIn_TUI() {

        if let password = passwordTextField.text, password == "123456", let email = emailTextField.text, email == "test@test.com" {
            if isValidEmail(email) {
                UserDefaults.standard.setUserMail(value: email)
                viewModel.login(email: email, password: password) { completion in
                    if completion {
                        LoginRouter.startModule(navigationController: self.navigationController ?? UINavigationController(), viewController: TabBarController())
                    }
                }
            }
        }
    }
}
extension LoginViewController {
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}
