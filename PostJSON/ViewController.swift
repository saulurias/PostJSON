//
//  ViewController.swift
//  PostJSON
//
//  Created by saul ulises urias guzmàn on 31/10/16.
//  Copyright © 2016 saul ulises urias guzmàn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func postButtonPressed(_ sender: AnyObject) {
        postJSON()
    }
    

    func postJSON(){
       var request = URLRequest(url: URL(string: "http://apisaul.azurewebsites.net/api")!)
        request.httpMethod = "POST"
        let postString = "nombre=Prueba&correo=prueba@swift.com&telefono=6221181006&edad=21"
        request.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else{
                print("error\(error)")
                return
            }
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                print("Status code should be 200, but is \(httpStatus.statusCode)")
                print("Response: \(response)")
            }
            
            let responseString = String(data: data, encoding: .utf8)
            print("responseString\(responseString)")
        }
        task.resume()
        
    }
    
}

