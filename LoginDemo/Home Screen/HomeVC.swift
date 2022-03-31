//
//  HomeVC.swift
//  LoginDemo
//
//  Created by Muhammad Hassan on 25/03/2022.
//

import UIKit
import SDWebImage

class HomeVC: UIViewController {

    var updateModel: UpdateModel_Base?
    var userModel: Json4Swift_Base?
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
        lblName.text = "Name: " + (userModel?.data?.user?.name ?? "Name Not found")
        lblEmail.text = "Email: " + (userModel?.data?.user?.email ?? "Email Not found")
        lblGender.text = "Gender: " + (userModel?.data?.user?.gender ?? "Gender Not found")
        lblBirthday.text = "Birthday: " + (userModel?.data?.user?.birthday ?? "Birthday Not found")
        lblFollower.text = "Followers: \(String(describing: userModel?.data?.user?.followers ?? 00))"
        lblCountry.text = "country: " + (userModel?.data?.user?.country_id ?? "Country Not found")
        lblMarital.text = "Maried: " + (userModel?.data?.user?.marital_status ?? "Maried status Not found")
        lblImage.sd_setImage(with: URL(string: userModel?.data?.user?.photo ?? "" ))
        print( userModel?.data?.user?.photo ?? "")

    }
    override func viewWillAppear(_ animated: Bool) {
        <#code#>
    }
     
    @IBAction func btnUpdateClicked(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "UpdateProfile") as! UpdateProfile
        vc.userModel = userModel
        self.navigationController?.pushViewController(vc, animated: true)
        }
    
}
