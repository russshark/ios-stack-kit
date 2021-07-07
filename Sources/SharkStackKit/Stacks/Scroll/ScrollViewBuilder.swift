//
//  ScrollViewBuilder.swift
//  
//
//  Created by Russell Warwick on 04/07/2021.
//

import UIKit
import SharkUtils

open class ScrollViewBuilder: UIView {
    
    // MARK: - UI
        
    private let scrollView = UIScrollView().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.showsHorizontalScrollIndicator = false
        $0.showsVerticalScrollIndicator = false
    }
    
    private let stackView = UIStackView().with {
        $0.alignment = .fill
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: - Init
    
    public init(axis: NSLayoutConstraint.Axis, @UIViewBuilder views: () -> [UIView]) {
        
        super.init(frame: .zero)
            
        addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        if axis == .vertical {
            stackView.axis = .vertical
            stackView.distribution = .equalSpacing
            scrollView.alwaysBounceVertical = true
            scrollView.alwaysBounceHorizontal = false
            stackView.widthAnchor.constraint(equalTo:scrollView.widthAnchor).isActive = true
            
        } else {
            scrollView.alwaysBounceVertical = false
            scrollView.alwaysBounceHorizontal = true
            stackView.axis = .horizontal
            stackView.distribution = .fillEqually
            stackView.alignment = .center
            stackView.heightAnchor.constraint(equalTo:scrollView.heightAnchor).isActive = true
        }

        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.topAnchor.constraint(equalTo:topAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor)
        ])

        stackView.addArrangedSubViews(views())
    }

    required public init(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

public extension ScrollViewBuilder {

    @discardableResult
    func spacing(_ spacing: CGFloat) -> Self {
        stackView.spacing = spacing
        return self
    }

    @discardableResult
    func margin(_ margins: UIEdgeInsets) -> Self {
        stackView.margin(margins)
        return self
    }
    
    @discardableResult
    func alignment(_ alignment: UIStackView.Alignment) -> Self {
        stackView.alignment = alignment
        return self
    }
    
    @discardableResult
    func showVerticalIndicators(_ value: Bool) -> Self {
        scrollView.showsVerticalScrollIndicator = value
        return self
    }
    
    @discardableResult
    func showHorizontalIndicators(_ value: Bool) -> Self {
        scrollView.showsHorizontalScrollIndicator = value
        return self
    }
    
    @discardableResult
    func scrollDelegate(_ delegate: UIScrollViewDelegate) -> Self {
        scrollView.delegate = delegate
        return self
    }
}
