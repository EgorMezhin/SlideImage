//
//  ViewController.swift
//  SlideImage
//
//  Created by Egor Mezhin on 21.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private struct Constants {
        static let height: CGFloat = 270
        static let contentHeight: CGFloat = 1700
    }
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "shrek"))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var scrollView: UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.contentSize = CGSize(width: view.bounds.width, height: Constants.contentHeight)
        scrollView.backgroundColor = .green
        scrollView.delegate = self
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

//MARK: - Private methods
extension ViewController {
    private func setupUI() {
        view = scrollView
        scrollView.addSubview(imageView)
    }
}

//MARK: - UIScrollViewDelegate
extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let verticalOffset = Constants.height - scrollView.contentOffset.y
        if verticalOffset > Constants.height {
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: verticalOffset - view.safeAreaInsets.top,
                                                                    left: 0,
                                                                    bottom: 0,
                                                                    right: 0)
        } else {
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: Constants.height - view.safeAreaInsets.top,
                                                                    left: 0,
                                                                    bottom: 0,
                                                                    right: 0)
        }
        imageView.frame = CGRect(x: 0,
                                 y: scrollView.contentOffset.y,
                                 width: scrollView.frame.width,
                                 height: verticalOffset)
    }
}
