//
//  APIManager.swift
//  LoginDemo
//
//  Created by Muhammad Hassan on 25/03/2022.
//

import Foundation
import Alamofire
import UIKit

public class API{
    
    public func Login(vc:UIViewController,params: [String : Any], completionhandler:((String) -> ())?) {

        AF.request("http://198.101.12.193:30000/auth/token", method: .post,  parameters: params, encoding: JSONEncoding.default)
                                .responseJSON { response in
                                switch response.result {
                                case .success(let value):
                                    if let json = value as? [String: Any] {
                                    print(json["access_token"] as? String ?? String())
                                    let newtoken = json["access_token"] as? String

                                if newtoken != nil
                                {
                                   print("you reach there")
                                   completionhandler?(newtoken ?? "")
                                }
        
                            else
                            {
                                completionhandler?("")
                                print("fail in api")
                                let alert = UIAlertController(title: "Alert", message: "invalid Email_ID or password", preferredStyle: UIAlertController.Style.alert)
                                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                                vc.present(alert, animated: true, completion: nil)
                            }
                                    
                        }
                        case .failure(_):
                        print("some error occured")
                       }
                    }
               }
}

