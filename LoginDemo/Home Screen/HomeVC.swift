//
//  HomeVC.swift
//  LoginDemo
//
//  Created by Muhammad Hassan on 25/03/2022.
//

import UIKit
import SDWebImage

class HomeVC: UIViewController {

    var model: Json4Swift_Base?
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblGender: UILabel!
    @IBOutlet weak var lblBirthday: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblFollower: UILabel!
    @IBOutlet weak var lblCountry: UILabel!
    @IBOutlet weak var lblMarital: UILabel!
    @IBOutlet weak var lblImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblName.text = "Name: " + (model?.data?.user?.name ?? "Name Not found")
        lblEmail.text = "Email: " + (model?.data?.user?.email ?? "Email Not found")
        lblGender.text = "Gender: " + (model?.data?.user?.gender ?? "Gender Not found")
        lblBirthday.text = "Birthday: " + (model?.data?.user?.birthday ?? "Birthday Not found")
        lblFollower.text = "Followers: \(String(describing: model?.data?.user?.followers ?? 00))"
        lblCountry.text = "country: " + (model?.data?.user?.country_id ?? "Country Not found")
        lblMarital.text = "Maried: " + (model?.data?.user?.marital_status ?? "Maried status Not found")
        lblImage.sd_setImage(with: URL(string: model?.data?.user?.photo ?? "" ))
        print( model?.data?.user?.photo ?? "")

    }
    
     
    @IBAction func btnUpdateClicked(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "UpdateProfile") as! UpdateProfile
        vc.model = model
        self.navigationController?.pushViewController(vc, animated: true)
        }
    
}
