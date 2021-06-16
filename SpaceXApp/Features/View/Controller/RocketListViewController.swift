//
//  ViewController.swift
//  SpaceXApp
//
//  Created by Baris Saraldi on 15.06.2021.
//

import UIKit

class RocketListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var launchList: [RocketModels] = []
    private var sortedLaunchList: [RocketModels] = []
    
    private let rocketListViewModel: RocketListViewModel = RocketListViewModel()
    private let rocketListCollecionView: RocketListCollecionView = RocketListCollecionView()
    override func viewDidLoad() {
        super.viewDidLoad()
        service()
        initDelegate()
        title = Constants.rocketListViewControllerTitle
        setupUI()
    }
    
    //MARK: Functions
    
    func setupUI() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sort", style: .done, target: self, action: #selector(sort))
    }
    
    @objc func sort() {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
               let sortDesc = UIAlertAction(title: "Sort By Year Descending", style: .default, handler: { [weak self] _  in
                   guard let self = self else { return }
                   
                   let sorted = self.launchList.sorted { (first, second) -> Bool in
                    Int(first.launch_year ?? "") ?? 0 > Int(second.launch_year ?? "") ??  0
                   }
                   self.sortedLaunchList = sorted
                   self.collectionView.reloadData()
               })
        
        let sortAsc =  UIAlertAction(title: "Sort By Year Ascending", style: .default, handler: { [weak self] _  in
            guard let self = self else { return }
            
            let sorted = self.launchList.sorted { (first, second) -> Bool in
                Int(first.launch_year ?? "") ?? 0 < Int(second.launch_year ?? "") ??  0
            }
            self.sortedLaunchList = sorted
            self.collectionView.reloadData()
        })
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        actionSheet.addAction(sortDesc)
        actionSheet.addAction(sortAsc)
        actionSheet.addAction(cancel)
        
        present(actionSheet, animated: true)
    }

    private func initDelegate() {
        collectionView.delegate = rocketListCollecionView
        collectionView.dataSource = rocketListCollecionView
        rocketListCollecionView.delegate = self
    }
    
    private func service() {
        rocketListViewModel.service { models in
            self.rocketListCollecionView.update(items: models)
            self.collectionView.reloadData()
        } onFail: { error in
            print(error ?? Constants.nilValue)
        }
    }
}

extension RocketListViewController:RocketListCollecionViewOutput {
    func getNavCont() -> UINavigationController? {
        return navigationController
    }
    
    func getStoryBoard() -> UIStoryboard? {
        return storyboard
    }
}
