//
//  PhotoSlideVC.swift
//  GameApp
//
//  Created by Zeynep Gizem Gürsoy on 11.03.2022.
//

import UIKit

class PhotoSlideVC: UIViewController {

    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    var selectedGame: Game?
    var photos = [String]()
    
    var currentPage = 0 {
        didSet {
            if currentPage == photos.count - 1 {
                //son sayfa
                rightButton.isHidden = true
                leftButton.isHidden = false
            }else {
                //son sayfa değil
                if currentPage == 0 {
                    rightButton.isHidden = false
                    leftButton.isHidden = true
                }else {
                    rightButton.isHidden = false
                    leftButton.isHidden = false
                }
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        //collectionView.contentInset = UIEdgeInsets(top: 20, left:0, bottom: 20, right:0)
        // Do any additional setup after loading the view.
        for ss in (selectedGame?.short_screenshots)!{
            photos.append(ss.image!)
        }
        leftButton.isHidden = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func leftClicked(_ sender: UIButton) {
        currentPage -= 1
        let indexPath = IndexPath(item: currentPage, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    @IBAction func rightClicked(_ sender: UIButton) {
        currentPage += 1
        let indexPath = IndexPath(item: currentPage, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredVertically, animated: true)
    }
    @IBAction func cancelClicked(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension PhotoSlideVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SlidePhotoCell", for: indexPath) as! SlidePhotoCell
        cell.configure(img: photos[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: collectionView.frame.width, height: 280)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        
    }
    
}
