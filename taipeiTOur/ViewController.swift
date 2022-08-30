//
//  ViewController.swift
//  taipeiTOur
//
//  Created by apple on 2022/8/23.
//

import UIKit

class ViewController: UIViewController {
    var pointsArray: [Points.Point] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadData()
    }

    func loadData(){
        let urlString = "https://www.travel.taipei/open-api/zh-tw/Attractions/All?categoryIds=12&page=1"
        guard let url = URL(string: urlString) else{
            print("inValid URL!!!")
            return
        }
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "accept")
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                fatalError(error.localizedDescription)
            }
            guard let data = data else {
                return
            }
            do{
                let points = try JSONDecoder().decode(Points.self, from: data)
                print(points.total)
                DispatchQueue.main.async{
                    for p in points.data{
                        self.pointsArray.append(p)
                    }
                    print("=====")
                }
            }
            catch let error{
                            //fatalError(error.localizedDescription)
                print(error.localizedDescription)
            }
        }.resume()
    }
    @IBAction func pointsAdvise(_ sender: Any) {
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailVC")as! DetailedViewController
        print(pointsArray[0].name)
        detailVC.name = pointsArray[0].name
            
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

