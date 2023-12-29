//
//  ViewController.swift
//  Solution_4
//
//  Created by Николай Чупреев on 27.12.2023.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    private lazy var webView: WKWebView = {
        let webView = WKWebView()
        webView.navigationDelegate = self
        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(webView)
        webView.frame = view.bounds
        
        if let url = URL(string: "https://oauth.vk.com/authorize?client_id=51811356&display=mobile&redirect_uri=https://oauth.vk.com/blank.html&scope=friends,groups,photos&response_type=token&v=5.35&state=123456") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment else {
            decisionHandler(.allow)
            return
        }
        
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        let token = params["access_token"]
        let userID = params["user_id"]
        print("Token \(String(describing: token))")
        print("UserID \(String(describing: userID))")
        
        let userDefaults = UserDefaults.standard
        userDefaults.setValue(token, forKey: "acsessToken")
        userDefaults.setValue(userID, forKey: "keyUserID")
        
        let tabBarController = NavBarTabBarController()
        tabBarController.selectedViewController = tabBarController.viewControllers?[0]
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let sceneDelegate = windowScene.delegate as? SceneDelegate {
            if let window = sceneDelegate.window {
                window.rootViewController = tabBarController
            }
        }
        
        decisionHandler(.cancel)
        webView.removeFromSuperview()
    }
}

