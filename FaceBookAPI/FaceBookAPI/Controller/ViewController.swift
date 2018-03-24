//
//  ViewController.swift
//  FaceBookAPI
//
//  Created by Appinventiv on 22/03/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var accessToken = ""
    var id = ""
    var boolean = false
    
    @IBOutlet weak var accessTokenText: UITextField!

    @IBOutlet weak var profilePicture: UIImageView!
    
    @IBOutlet weak var backgroundImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthDayLabel: UILabel!
    @IBOutlet weak var schoolName: UILabel!
    @IBOutlet weak var collegeName: UILabel!
    @IBOutlet weak var courseLabel: UILabel!
    
    @IBAction func searchBtn(_ sender: Any) {
        
        self.accessToken = self.accessTokenText.text!
        self.getAPI()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ViewController{
    
    //MARK: --> Calling APIManager
    func getAPI(){
        
        APIManager().login(accessToken: accessToken){ (fields) in
            
            DispatchQueue.main.async{
                self.id = fields.id
                self.nameLabel.text = fields.name
                self.birthDayLabel.text = fields.birthDay
                self.schoolName.text = fields.schoolName
                self.collegeName.text = fields.collegeName
                self.courseLabel.text = fields.collegeCource
                
                UIView.animate(withDuration: 2.0, animations:{
                    self.nameLabel.isHidden = self.boolean
                    self.birthDayLabel.isHidden = self.boolean
                    self.schoolName.isHidden = self.boolean
                    self.collegeName.isHidden = self.boolean
                    self.courseLabel.isHidden = self.boolean
                    
                })

                
                self.getImage()
            }
        }
    }
    
    func getImage(){
        self.profilePicture.alpha = 0.0
        self.profilePicture.layer.cornerRadius = 120
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(0), execute: {
        UIView.animate(withDuration: 1.0, animations:{
            
            self.profilePicture.alpha = 1.0
            self.backgroundImage.alpha = 1.0

            let url = NSURL(string: "https://graph.facebook.com/\(self.id)/picture?type=large")
            let data = NSData(contentsOf: url! as URL)
            self.profilePicture.image = UIImage(data:data! as Data,scale:1.0)})
            self.backgroundImage.image = self.profilePicture.image
       })
    }
}
