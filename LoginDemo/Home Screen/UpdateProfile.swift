//
//  UpdateProfile.swift
//  LoginDemo
//
//  Created by Muhammad Hassan on 30/03/2022.
//

import UIKit
import Alamofire

class UpdateProfile: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate
 {
    var userModel: Json4Swift_Base?
    @IBOutlet weak var txtMobileNumber: UITextField!
    @IBOutlet weak var txtGender: UITextField!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var lblImage: UIImageView!
    
    var imagePicker = UIImagePickerController()
    let api = API()

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    
    @IBAction func btnupdateProfile(_ sender: UIButton)
    {
        
        if txtName.text != "" && txtMobileNumber.text != "" && txtGender.text != "" && lblImage.image != nil
        {
            Updateprofile()
        }
        else
        {
            openAlert(title: "Alert", message: "Please fill all the field", alertStyle: .alert, actionTitles: ["ok"], actionStyles: [.default], actions: [{ _ in }])
        }
        
    }
    
    func Updateprofile() {
        
        let param = [
            "name": txtName.text!,
            "gender": txtGender.text!,
            "phone": txtMobileNumber.text!,
//            "photo": convertImageToBase64String()
        ] as [String : Any]
        
        let url = "http://209.126.81.76/ducktindo_dev2/api/v1/update_user"
        let token = userModel?.data?.access_token ?? ""
        let header : HTTPHeaders = ["Authorization": "Bearer \(token)"]
        
        api.UploadData(vc: self, params: param, img: lblImage.image ?? UIImage(), url: url, header: header)
        { [self]
            status, Data, UpdateModel in
            if status == 1
            {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
                vc.updateModel = UpdateModel
                print(userModel?.data?.user?.name)
                print(Data)
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    
    // Image Upload methods
    @IBAction func ImageUpload(_ sender: UIButton)
    {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = false
            present(imagePicker, animated: true, completion: nil)
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        picker.dismiss(animated: true, completion: nil)
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            lblImage.image = image
        }
    }
    
    func convertImageToBase64String () -> String {
        let converted = lblImage.image?.jpegData(compressionQuality: 1)?.base64EncodedString() ?? ""
//        print(converted)
        return converted
    }
}
