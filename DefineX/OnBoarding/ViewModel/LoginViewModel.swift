//
//  LoginViewModel.swift
//  DefineX
//
//  Created by Yarkın Gazibaba on 26.07.2023.
//

import Foundation
import UIKit
import SkyFloatingLabelTextField
import Alamofire
import Combine

class LoginViewModel {

    let lightGreyColor = UIColor(red: 197/255, green: 205/255, blue: 205/255, alpha: 1.0)
    let darkGreyColor = UIColor(red: 52/255, green: 42/255, blue: 61/255, alpha: 1.0)
    let overcastBlueColor = UIColor(red: 0, green: 187/255, blue: 204/255, alpha: 1.0)

    let startColor = UIColor(red: 26/255, green: 115/255, blue: 233/255, alpha: 1.0).cgColor
    let endColor = UIColor(red: 108/255, green: 146/255, blue: 244/255, alpha: 1.0).cgColor

    private var cancellables = Set<AnyCancellable>()

//    private(set) var isLoading = Bindable<Bool>()
//    private(set) var error = Bindable<Error>()
//    private(set) var movies = Bindable<[Movie]>()
//    private var movieList = [Movie]()
//    private(set) var totalMovieCount = Bindable<String>()
//    private var internalPage = 1
//    private var limit = 10
//    var hasMore = true
//    var shouldDisplayLoading = false
//    var currentMovieCount: Int {
//        return movies.value?.count ?? 0
//    }
    // func getProducts() -> {

    // }
//
//    func getMovies(query:String, noLoading: Bool = false, shouldRefresh: Bool = false){
//        if shouldRefresh {
//            internalPage = 1
//            self.movieList.removeAll()
//            hasMore = true
//            isLoading.value = true
//        }
//        guard hasMore else { return }
//        Service.fetchMovies(movieName: query, page: internalPage) { [weak self] response in
//            guard let self = self else {return}
//            self.isLoading.value = false
//            if let movies = response?.movies {
//                self.hasMore = !(movies.count < self.limit)
//                self.internalPage += 1
//                self.movieList.append(contentsOf: movies)
//                self.movieList = self.movieList.unique(for: \.imdbID)
//                self.movies.value = self.movieList
//            } else {
//                self.hasMore = false
//            }
//            self.totalMovieCount.value = response?.totalResults
//            self.shouldDisplayLoading = false
//        } onError: { [weak self] error in
//            guard let self = self else { return }
//            self.isLoading.value = false
//            self.shouldDisplayLoading = false
//            self.error.value = error
//        }
//    }
//
//    func removeMovies() {
//        movies.value?.removeAll()
//        movieList.removeAll()
//        totalMovieCount.value = "\(movieList.count)"
//        hasMore = false
//    }
}

// MARK: - UI Methods
extension LoginViewModel {
    func setTextFieldProperties(emailTextField: SkyFloatingLabelTextField, passwordTextfield: SkyFloatingLabelTextField) {
        titLeFormatter(textField: emailTextField)
        titLeFormatter(textField: passwordTextfield)
        emailTextField.tintColor = Asset.loginSelectedColor.color.withAlphaComponent(0.4)
        emailTextField.textColor = darkGreyColor
        emailTextField.lineColor = darkGreyColor
        emailTextField.selectedTitleColor = .black
        emailTextField.selectedLineColor = UIColor.gradientColor(colors: [startColor, endColor], startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 1, y: 1))

        passwordTextfield.tintColor =  Asset.loginSelectedColor.color
        passwordTextfield.textColor = darkGreyColor
        passwordTextfield.lineColor = darkGreyColor
        passwordTextfield.selectedTitleColor = .black
        passwordTextfield.selectedLineColor = UIColor.gradientColor(colors: [startColor, endColor], startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 1, y: 1))
    }

    func titLeFormatter(textField: SkyFloatingLabelTextField) {
        textField.titleFormatter = { text in
            guard let firstChar = text.first else {
                return ""
            }
            let restOfString = text.dropFirst().lowercased()
            return String(firstChar).uppercased() + restOfString
        }
    }

    func setTextFieldsImages(emailIcon: UIImage, lockIcon: UIImage, emailTextField: SkyFloatingLabelTextField, passwordTextfield: SkyFloatingLabelTextField) {
        let mailImageView = UIImageView()
        mailImageView.image = emailIcon
        emailTextField.rightView = mailImageView

        let lockImageView = UIImageView()
        lockImageView.image = lockIcon
        passwordTextfield.rightView = lockImageView
    }

    func gradientColor(bounds: CGRect, gradientLayer: CAGradientLayer, colors: [CGColor]) -> UIColor? {
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        // create UIImage by rendering gradient layer.
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        // get gradient UIcolor from gradient UIImage
        return UIColor(patternImage: image!)
    }

    func getGradientLayer(bounds: CGRect, colors: [CGColor]) -> CAGradientLayer {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        // order of gradient colors
        gradient.colors = colors
        // start and end points
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        return gradient
    }

    func handleToken(loginResponse: LoginResponse) {
        if let token = loginResponse.token {
            UserDefaults.standard.setToken(value: token)
            UserDefaults.standard.setAuthanticatedUser(value: true)
        }
    }

    func login(email: String, password: String, completion: @escaping (Bool) -> Void) {
        let parameters: Parameters = [
            "email": email,
            "password": password
        ]

        let cancellable = ServiceManager.shared.post(path: ApiCaller.ServiceEndPoint.logIn(), parameters: parameters)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("HTTP request completed.")
                case .failure(let error):
                    print("Error fetching data: \(error)")
                }
            }, receiveValue: { (loginResponse: LoginResponse) in
                // Handle the login response here
                print(loginResponse)
                self.handleToken(loginResponse: loginResponse)
                completion(true)
            })
        cancellables.insert(cancellable)
    }

}
