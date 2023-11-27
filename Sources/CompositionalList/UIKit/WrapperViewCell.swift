//
//  WrapperViewCell.swift
//  CompositionalList
//
//  Created by James Rochabrun on 1/10/21.
//

import UIKit
import SwiftUI

/// UICollectionviewCell abstraction that hosts a SwfitUI `View`
@available(iOS 13.0, *)
final public class WrapperViewCell<V: View>: BaseCollectionViewCell<V> {
    
    private var hostView: HostView<V>?

    public override func setupWith(_ viewModel: V, parent: UIViewController?) {
        hostView = HostView<V>(parent: parent, view: viewModel)
        guard let hostView = hostView else { return }
        contentView.addSubview(hostView)
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        hostView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostView.topAnchor.constraint(equalTo: contentView.topAnchor),
            hostView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            hostView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            hostView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        hostView?.removeFromSuperview()
        hostView = nil
    }
}
