//
//  APIManager.swift
//  LoginDemo
//
//  Created by Muhammad Hassan on 25/03/2022.
//

import Foundation
import Alamofire
import UIKit
import ObjectMapper

public class API{
    
    func Login(vc:UIViewController,params: [String : Any],url:String, completionhandler:((String, Json4Swift_Base) -> ())?) {

        AF.request(url, method: .post,  parameters: params, encoding: JSONEncoding.default)
             .responseJSON { response in
                 switch response.result {
                 case .success(let value):
                     if let json = value as? [String: Any] {
                         let newtoken = json["data"] as? [String:Any]
                         print(newtoken?["access_token"] ?? "Token not found")
                         
                       let status = json["status"] as? Bool
                         let message = json["message"] as? String
                         if status == false
                         {
                             let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.alert)
                             alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                             vc.present(alert, animated: true, completion: nil)
                         }
                         let a = response.data
                         do {
//                             let responseData = String(data: a!, encoding: String.Encoding.utf8)
                             let result = try JSONDecoder().decode(Json4Swift_Base.self, from: a!)
                             if newtoken != nil
                             { completionhandler?("\(String(describing: newtoken) )", result) }
                             else
                             {
                                 completionhandler?("", result)
                                 let alert = UIAlertController(title: "Alert", message: "invalid Email_ID or password", preferredStyle: UIAlertController.Style.alert)
                                 alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                                 vc.present(alert, animated: true, completion: nil)
                             }
                         }
                         catch { print(error) }
                     }
                 case .failure(_):
                     print("Login failed unknow error")
                 }
             }
     }
        
    func UploadData(vc:UIViewController,params: [String : Any],img:UIImage, url: String, header: HTTPHeaders, completionhandler:((Int,Any) -> ())?)  {
        AF.upload(
               multipartFormData: { multipartFormData in
                   multipartFormData.append(img.jpegData(
                       compressionQuality: 0.5)!,
                       withName: "photo",
                       fileName: "photo.jpeg", mimeType: "image/jpeg"
                   )
                   for param in params {
                       let value = (param.value as AnyObject).data(using: String.Encoding.utf8.rawValue)!
                       multipartFormData.append(value, withName: param.key)
                   }
               },
               to: url,
               method: .post ,
               headers: header
           )
           .response { response in
               switch response.result {
               case .success(let value):
                   var b = [String:Any]()
                   do{
                   let json = try JSONSerialization.jsonObject(with: value!, options: []) as? [String : Any]
                       b = json ?? [String:Any]()
                       print(b)
                       // json?["data"]
                       let decoder = JSONDecoder()

                   }
                   catch{ print("erroMsg") }
                   let status = b["status"]
                   let data = b["data"]
                   print(data as Any)
                   print(status ?? 0)
                   if status as! Int == 1
                   {
                       print("status \(status!) founded")
//                       let result = try JSONDecoder().decode(Json4Swift_Base.self, from: a!)
                       completionhandler?(status as! Int, data as Any )
                   }
                   else
                   { print("Invalid data entered") }
                   
               case .failure(_):
                   print("failed to upload data")
               }

        }
    }
    
}
