//
//  ArtistViewController.swift
//  Spotify-iOS
//
//  Created by 김나연 on 5/12/24.
//

import UIKit

import SnapKit
import Then

final class ArtistViewController: UIViewController {
    
    // MARK: - Properties
    
    private let indicatorBarHorizontalPadding: CGFloat = 6
    private let tabbarCellHorizontalPadding: CGFloat = 10
    private let tabbarInteritemSpacing: CGFloat = 13
    private let tabbarData = ArtistTabbarModel.tabbarData()
    private var viewControllers: [UIViewController] = []
    private var currentMenuIndex: Int = 0 {
        didSet {
            moveIndicatorbar(to: currentMenuIndex)
        }
    }
    private var currentPageIndex = 0 {
        didSet {
            setPageVC(from: oldValue, to: currentPageIndex)
        }
    }
    
    // MARK: - UI Components
    
    private let rootView = ArtistView()
    private lazy var collectionView = rootView.tabbarCollectionView
    private lazy var pageViewController = rootView.pageViewController

    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigationBar()
        setStyle()
        setDelegate()
        setRegister()
        setPageViewController()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        moveIndicatorbar(to: 0)
    }
}

// MARK: - Extensions

private extension ArtistViewController {
    
    // MARK: - Methods
    
    func setNavigationBar() {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func setStyle() {
        rootView.scrollView.do {
            /// ScrollView의 contentInset을 설정합니다.
            /// top은 0으로(=> safeArea를 무시하고), bottom은 [safeArea bottomInset과 탭바 길이를 합한 값]으로 설정했습니다.
            $0.contentInset = .init(top: 0, left: 0, bottom: bottomInset(), right: 0)
            $0.contentInsetAdjustmentBehavior = .never
            $0.showsHorizontalScrollIndicator = false
            $0.showsVerticalScrollIndicator = false
        }
    }
    
    func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
        pageViewController.delegate = self
        pageViewController.dataSource = self
    }

    func setRegister() {
        collectionView.register(ArtistTabbarCell.self, forCellWithReuseIdentifier: ArtistTabbarCell.className)
    }
    
    func setPageViewController() {
        addViewControllersData()
        guard let firstVC = viewControllers.first else { return }
        pageViewController.setViewControllers([firstVC], direction: .forward, animated: true)
    }
    
    func addViewControllersData() {
        let artistMusicViewController = ArtistMusicViewController(pageVC: pageViewController)
        viewControllers.append(artistMusicViewController)
        for _ in 0 ..< tabbarData.count - 1 {
            let vc = UIViewController()
            vc.view.backgroundColor = .spotifyGray10
            viewControllers.append(vc)
        }
    }
    
    func setIndicatorBarIndex(to newIndex: Int) {
        self.currentMenuIndex = newIndex
    }
    
    func setPageIndex(to newIndex: Int) {
        self.currentPageIndex = newIndex
    }
    
    func moveIndicatorbar(to newIndex: Int) {
        let indexPath = IndexPath(item: newIndex, section: 0)
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        guard let cell = collectionView.cellForItem(at: indexPath) as? ArtistTabbarCell else { return }
        
        rootView.indicatorBar.snp.remakeConstraints {
            $0.width.equalTo(cell.frame.width - tabbarCellHorizontalPadding + indicatorBarHorizontalPadding)
            $0.height.equalTo(2)
            $0.top.equalTo(collectionView.snp.bottom)
            $0.centerX.equalTo(cell)
        }
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    func setPageVC(from currentIndex: Int, to newIndex: Int) {
        guard 0 <= newIndex && newIndex < viewControllers.count else { return }
        let direction: UIPageViewController.NavigationDirection = currentIndex < newIndex ? .forward : .reverse
        pageViewController.setViewControllers([viewControllers[newIndex]], direction: direction, animated: true)
        setIndicatorBarIndex(to: newIndex)
    }
    
    func checkIfBarAndPageAreInSameIndex(for currentIndex: Int) -> Bool {
        return currentMenuIndex == currentIndex
    }
}

extension ArtistViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let newIndex = indexPath.item
        self.currentMenuIndex = newIndex
        setPageIndex(to: newIndex)
    }
}

extension ArtistViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tabbarData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ArtistTabbarCell.className, for: indexPath) as? ArtistTabbarCell else { return UICollectionViewCell() }
        cell.configure(title: tabbarData[indexPath.item].title)
        return cell
    }
}

extension ArtistViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = tabbarData[indexPath.item].title
            .getLabelContentSize(withFont: .font(.regular_kr3))
            .width + tabbarCellHorizontalPadding
        return CGSize(
            width: cellWidth,
            height: collectionView.frame.height
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return tabbarInteritemSpacing
    }
}

extension ArtistViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        guard let newVC = pendingViewControllers.first,
              let newIndex = viewControllers.firstIndex(of: newVC)
        else { return }
        setIndicatorBarIndex(to: newIndex)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard let currentVC = pageViewController.viewControllers?.first,
              let currentPageIndex = viewControllers.firstIndex(of: currentVC)
        else { return }
        if !checkIfBarAndPageAreInSameIndex(for: currentPageIndex) {
            setIndicatorBarIndex(to: currentPageIndex)
        }
    }
}

extension ArtistViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = viewControllers.firstIndex(of: viewController) else { return nil }
        let previousIndex = index - 1
        return previousIndex < 0 ? nil : viewControllers[previousIndex]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = viewControllers.firstIndex(of: viewController) else { return nil }
        let nextIndex = index + 1
        return nextIndex == viewControllers.count ? nil : viewControllers[nextIndex]
    }
}
