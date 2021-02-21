//
//  WKWebViewController.swift
//  VK-2
//
//  Created by Julie on 18.02.2021.
//

import UIKit
import WebKit

class WKWebViewController: UIViewController {

    @IBOutlet weak var webview: WKWebView! {
        didSet{
            webview.navigationDelegate = self
        }
    }
    
    var urlComponents = URLComponents()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
        URLQueryItem(name: "client_id", value: "7765962"),
            URLQueryItem(name: "display", value: "mobile"),
        URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
        URLQueryItem(name: "scope", value: "262150"),
        URLQueryItem(name: "response_type", value: "token"),
        URLQueryItem(name: "v", value: "5.130")
        ]
        
        let request = URLRequest(url: urlComponents.url!)
        
        webview.load(request)
        
            
        }
        
        
    }
    
    



extension WKWebViewController: WKNavigationDelegate {
    
    
    
    func webView (_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment else {
            decisionHandler(.allow)
            return
        }
        
        let params = fragment.components(separatedBy: "&")
            .map { $0.components(separatedBy: "=")}
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        
        let token = params["access_token"] ?? ""
        let userid = params["user_id"] ?? ""
        
        print("token is: " + token)
        print("user_id is: " + userid)
        
        Session.shared.token = token
        Session.shared.userid = userid
 
        
        
        
//        print("saved token is: " + Session.shared.token)
//        print("saved user_id is: " + Session.shared.userid)
        
//        performSegue(withIdentifier: "showApp", sender: nil)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let finalVC = storyboard.instantiateViewController(identifier: "LoginFormVC")
        show(finalVC, sender: nil)
        
        
        decisionHandler(.cancel)
    }
}
