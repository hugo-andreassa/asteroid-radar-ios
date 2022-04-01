//
//  ViewController.swift
//  NeoWs
//
//  Created by Hugo Andreassa Amaral (P) on 01/04/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var pictureOfDayLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var asteroidList = [
        Asteroid(id: 0, codename: "TESTE 1", closeApproachDate: "Teste", absoluteMagnitude: 0.0, estimatedDiameter: 0.0, relativeVelocity: 0.0, distanceFromEarth: 0.0, isPotentiallyHazardous: true),
        Asteroid(id: 0, codename: "TESTE 2", closeApproachDate: "Teste", absoluteMagnitude: 0.0, estimatedDiameter: 0.0, relativeVelocity: 0.0, distanceFromEarth: 0.0, isPotentiallyHazardous: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getPictureOfDay()
    }
    
    private func getPictureOfDay() {
        let service = PictureOfDayService()
        service.getImage { (image) in
            DispatchQueue.main.async {
                if let safeImage = image {
                    let url = URL(string: safeImage.url)
                    let data = try? Data(contentsOf: url!)
                    self.imgView.image = UIImage(data: data!)
                    
                    self.pictureOfDayLabel.text = safeImage.title
                }
            }
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return asteroidList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = asteroidList[indexPath.row]
        
        if item.isPotentiallyHazardous {
            let cell = tableView.dequeueReusableCell(withIdentifier: "asteroidCellSad", for: indexPath) as! AsteroidCell
            cell.tituloLabel.text = item.codename
            cell.subtituloLabel.text = item.closeApproachDate
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "asteroidCellHappy", for: indexPath) as! AsteroidCell
            cell.tituloLabel.text = item.codename
            cell.subtituloLabel.text = item.closeApproachDate
            return cell
        }
    }
}



