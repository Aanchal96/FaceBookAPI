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
    
    @IBOutlet weak var profilePicture: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthDayLabel: UILabel!
    @IBOutlet weak var schoolName: UILabel!
    @IBOutlet weak var collegeName: UILabel!
    @IBOutlet weak var courseLabel: UILabel!

    @IBOutlet weak var accessTokenText: UITextField!
    
    @IBOutlet weak var searchBtn: UIButton!
    
    @IBAction func searchBtn(_ sender: Any) {
        
        self.accessToken = self.accessTokenText.text!
        APIManager().loginGet(accessToken: accessToken){ (fields) in
            
            DispatchQueue.main.async{
                self.id = fields.id
                self.nameLabel.text = fields.name
                self.birthDayLabel.text = fields.birthDay
                self.schoolName.text = fields.schoolName
                self.collegeName.text = fields.collegeName
                self.courseLabel.text = fields.collegeCource

                self.nameLabel.isHidden = self.boolean
                self.birthDayLabel.isHidden = self.boolean
                self.schoolName.isHidden = self.boolean
                self.collegeName.isHidden = self.boolean
                self.courseLabel.isHidden = self.boolean
          
                print(self.id)
        }
            
    }
    }

    func getImage(){
        let url = "https://static.wixstatic.com/media/2cd43b_9e40d284910240479b94e37f071f702a~mv2.png/v1/fill/w_196,h_177,al_c,usm_0.66_1.00_0.01/2cd43b_9e40d284910240479b94e37f071f702a~mv2.png"
        let url2 = NSURL(string: url)
        let data = NSData(contentsOf: url2! as URL)
        print("#######")
        print(data as Any)
        print(url2!)
              // self.profilePicture.image = UIImage(data:data! as Data,scale:1.0)

//    let url = "https://graph.facebook.com/742056515858366/picture?type=large"
//    let request = NSMutableURLRequest(url: NSURL(string: url)! as URL,
//                                                      cachePolicy: .useProtocolCachePolicy,
//                                                      timeoutInterval: 10.0)
//                    request.httpMethod = "GET"
//
//                    let session = URLSession.shared
//                    let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
//                        if (error != nil) {
//                            print("//////")
//                        }
//                        else {
//                            let httpResponse = response as? HTTPURLResponse
//                            print(httpResponse as Any)
//                            print(data as Any)
//
//                            self.profilePicture.image = UIImage(data: data!)
//                            }
//                    })
//
//                    dataTask.resume()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.accessTokenText.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension ViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.accessTokenText.resignFirstResponder()
        return true
    }
}

