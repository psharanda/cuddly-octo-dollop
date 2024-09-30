//  Copyright Snap Inc. All rights reserved.

import Combine
import SCSDKCameraKit
import SCSDKCameraKitReferenceUI
import SwiftUI

@available(iOS 14.0, *)
/// An observable state object the CameraView can watch for changes to state in CameraKit
public class CameraViewState: NSObject, ObservableObject {
    private var cancelleables: Set<AnyCancellable> = []
    private var hideMessage: DispatchWorkItem?

    weak var cameraController: CameraController! {
        didSet {
            guard let controller = cameraController else { return }
            controller.uiDelegate = self
            $selectedLens
                .sink { [weak self] lens in
                    if let lens {
                        controller.applyLens(lens)
                        self?.showingMessage = true
                        self?.hideMessage?.cancel()
                        let hideMessage = DispatchWorkItem(block: { self?.showingMessage = false })
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: hideMessage)
                        self?.hideMessage = hideMessage
                    } else {
                        controller.clearLens()
                        self?.showingMessage = false
                    }
                }.store(in: &cancelleables)
        }
    }

    /// The lenses available for selection
    @Published var lenses: [Lens] = []

    /// The selected lens, if one is selected
    @Published var selectedLens: Lens?

    /// Whether a lens is being loaded or not
    @Published var loading = false

    /// Any hint that a lens has requested be displayed
    @Published var hint: String?

    /// A photo/video the user has captured, if they have captured one
    @Published var captured: Captured?

    /// Whether a diagnostic message is being displayed
    @Published var showingMessage = false
}

@available(iOS 14.0, *)
extension CameraViewState {
    /// Convenience setter for the captured property
    /// - Parameters:
    ///   - photo: the photo captured
    ///   - error: any error that occurred during capture
    func tookPhoto(_ photo: UIImage?, error: Error?) {
        guard let photo else { return }
        captured = .photo(image: photo)
    }

    /// Convenience setter for the captured property
    /// - Parameters:
    ///   - video: the url to the video captured
    ///   - error: any error that occurred during capture
    func tookVideo(_ video: URL?, error: Error?) {
        guard let video else { return }
        captured = .video(url: video)
    }
}

@available(iOS 14.0, *)
extension CameraViewState: CameraControllerUIDelegate {
    public func cameraControllerRequestedActivityIndicatorShow(_ controller: CameraController) {
        loading = true
    }

    public func cameraControllerRequestedActivityIndicatorHide(_ controller: CameraController) {
        loading = false
    }

    public func cameraController(_ controller: CameraController, updatedLenses lenses: [Lens]) {
        self.lenses = lenses
    }

    public func cameraController(
        _ controller: CameraController, requestedHintDisplay hint: String, for lens: Lens, autohide: Bool
    ) {
        self.hint = hint
        if autohide {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
                if self?.hint == hint {
                    self?.hint = nil
                }
            }
        }
    }

    public func cameraController(_ controller: CameraController, requestedHintHideFor lens: Lens) {
        hint = nil
    }

    // To be implemented once CameraActionsView is ported to SwiftUI, otherwise unnecessary.

    public func cameraControllerRequestedRingLightShow(_ controller: CameraController) {
    }

    public func cameraControllerRequestedRingLightHide(_ controller: CameraController) {
    }

    public func cameraControllerRequestedFlashControlHide(_ controller: CameraController) {
    }

    public func cameraControllerRequestedSnapAttributionViewShow(_ controller: CameraController) {
    }

    public func cameraControllerRequestedSnapAttributionViewHide(_ controller: CameraController) {
    }

    public func cameraControllerRequestedCameraFlip(_ controller: CameraController) {
    }
}

enum Captured {
    case photo(image: UIImage)
    case video(url: URL)
}

extension Captured: Identifiable {
    var id: Int {
        switch self {
        case let .photo(image):
            return image.hashValue
        case let .video(url):
            return url.hashValue
        }
    }
}
