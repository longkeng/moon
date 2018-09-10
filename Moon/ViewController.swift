//
//  ViewController.swift
//  Moon
//
//  Created by Nguyenthanh Long on 9/8/18.
//  Copyright © 2018 Geniee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let data:[Animal] = [Animal(imageName: "dog", name: "Con Chó"),
                         Animal(imageName: "cat", name: "Con Mèo"),
                         Animal(imageName: "horse", name: "Con Ngựa"),
                         Animal(imageName: "chicken", name: "Con Gà"),
                         Animal(imageName: "lion", name: "Con Sư tử"),
                         Animal(imageName: "duck", name: "Con Vịt"),
                         Animal(imageName: "goat", name: "Con Dê"),
                         Animal(imageName: "elephant", name: "Con Voi"),
                         Animal(imageName: "pig", name: "Con Lợn"),
                         Animal(imageName: "sheep", name: "Con Cừu"),
                         Animal(imageName: "tiger", name: "Con Hổ")
                        ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Động Vật";
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return data.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! CollectionViewCell
        let animal = data[indexPath.row]
        
        let animalImage = UIImage(named: animal.imageName)
        cell.displayContent(image: animalImage!, name: animal.name)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let animal = data[indexPath.row]
        let storyBoard = UIStoryboard(name: "Detail", bundle: Bundle.main)
        
        let vc = storyBoard.instantiateViewController(withIdentifier: "DetailImage") as! DetailImageViewController
        
        vc.title = animal.name
        vc.animalImageName = animal.imageName
        
        self.navigationController!.pushViewController(vc, animated: true)
    }


}

