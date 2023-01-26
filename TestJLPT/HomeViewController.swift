//
//  HomeViewController.swift
//  TestJLPT
//
//  Created by cmStudent on 25/12/2022.
//

import UIKit

class HomeViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout  {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    
//    var currentCellIndex = 0
//
//    var imageArr = ["cover4","cover2","cover3","cover4"]
//
//    var timer: Timer?
    
    var imgArray = [UIImage(named: "cover4")!,UIImage(named: "cover2")!,UIImage(named: "cover3")!,UIImage(named: "cover1")!]
    var timer : Timer?
    var currentCellIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        startTimer()
        pageControl.numberOfPages = imgArray.count
    }
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(moveToNextIndex), userInfo: nil, repeats: true)
    }
    @objc func moveToNextIndex() {
        if currentCellIndex < imgArray.count - 1 {
            currentCellIndex += 1
            
        } else {
            currentCellIndex = 0
        }
        collectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .centeredHorizontally, animated: true)
        pageControl.currentPage = currentCellIndex
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCell", for: indexPath) as! HomeCollectionViewCell
        cell.imgCover.image = imgArray[indexPath.row]
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    @IBAction func kannji(_ sender: Any) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "kannjiList") as! HomeTableViewController
        self.present(vc, animated: true, completion: nil)
    

//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "kannjiList") as! HomeTableViewController
//        let navigationController = UINavigationController(rootViewController: vc)
//        self.present(navigationController, animated: true, completion: nil)
    }
    

    @IBAction func listeningAction(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "listeningList") as! ListAudioViewController
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func notificationAction(_ sender: Any) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "gotoNoti") as! NotificationViewController
        self.present(vc, animated: true, completion: nil)
        
    }
    
    @IBAction func todoListAction(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "todoListVC") as! TodoListViewController
        let navigationController = UINavigationController(rootViewController: vc)
        self.present(navigationController, animated: true, completion: nil)
    }
    
    @IBAction func memoAction(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "memoVC") as! MemoListTableViewController
        let navigationController = UINavigationController(rootViewController: vc)
        self.present(navigationController, animated: true, completion: nil)
    }
    

}
