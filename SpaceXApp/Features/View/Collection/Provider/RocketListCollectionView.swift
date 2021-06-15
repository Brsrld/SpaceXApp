//
//  RocketListCollectionView.swift
//  SpaceXApp
//
//  Created by Baris Saraldi on 15.06.2021.
//

import Foundation
import UIKit

//MARK: Protocols

protocol RocketListCollecionViewProtocol {
    func update (items: [RocketModels])
}

protocol RocketListCollecionViewOutput: AnyObject {
    func getStoryBoard() -> UIStoryboard?
    func getNavCont() -> UINavigationController?
}

//MARK: CollectionView Functions

final class RocketListCollecionView: NSObject{
    
    private lazy var items: [RocketModels] = []
    
    weak var delegate: RocketListCollecionViewOutput?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        
        if let dataCell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellIdentifier, for: indexPath) as? RocketListCollectionViewCell {
            dataCell.configure(with: items[indexPath.row].mission_name ?? Constants.nilValue, with: items[indexPath.row].links.mission_patch ?? Constants.nilValue, with: items[indexPath.row].launch_year ?? Constants.nilValue, with: items[indexPath.row].rocket.rocket_name ?? Constants.nilValue)
            cell = dataCell
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = delegate?.getStoryBoard()?.instantiateViewController(identifier:Constants.rocketDetailViewControllerID) as? RocketDetailViewController
        vc?.rockets = items[indexPath.row]
        delegate?.getNavCont()?.pushViewController(vc! , animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let columns: CGFloat = 1.05
        let collectionViewWidth = collectionView.bounds.width
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let spaceBetweenCells = flowLayout.minimumInteritemSpacing * (columns - 1)
        let sectionInsets = flowLayout.sectionInset.left + flowLayout.sectionInset.right
        let adjustedWidth = collectionViewWidth - spaceBetweenCells - sectionInsets
        let width: CGFloat = floor(adjustedWidth / columns)
        let height: CGFloat = width / 2
        return CGSize(width: width, height: height)
    }
}

//MARK: Extensions

extension RocketListCollecionView: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {}
extension RocketListCollecionView: RocketListCollecionViewProtocol {
    func update (items: [RocketModels]) {
        self.items = items
    }
}
