//
//  EyeTrackView.swift
//
//
//  Created by Yuki Yamato on 2020/10/01.
//

import SwiftUI
import ARKit
import SceneKit
import os

public struct EyeTrackView: UIViewRepresentable {
    @State public var sceneView: ARSCNView = ARSCNView(frame: .infinite)
    public var eyeTrack: EyeTrack
    public var isHidden: Bool

    // Create a session configuration
    private var configuration = ARFaceTrackingConfiguration()
    private var logger: Logger = Logger(subsystem: "dev.ukitomato.EyeTrackKit", category: "EyeTrackView")

    public init(isHidden: Bool = true, eyeTrack: EyeTrack) {
        self.isHidden = isHidden
        self.eyeTrack = eyeTrack
        self.configuration.isLightEstimationEnabled = true
    }

    public init(isHidden: Bool = true, eyeTrack: EyeTrack, sceneView: ARSCNView) {
        self.isHidden = isHidden
        self.eyeTrack = eyeTrack
        self.sceneView = sceneView
    }


    public func makeUIView(context: Context) -> ARSCNView {
        self.sceneView.isHidden = self.isHidden
        self.sceneView.automaticallyUpdatesLighting = true

        // Setting recorder
        return sceneView
    }

    public func updateUIView(_ uiView: ARSCNView, context: Context) { }

    public func hide() -> Void {
        self.logger.debug("hide")
        self.sceneView.isHidden = true
    }

    public func show() -> Void {
        self.logger.debug("show")
        self.sceneView.isHidden = false
    }

    public func start() {
        // Run the view's session
        self.sceneView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
    }

    public func pause() {
        // Pause the view's session
        self.sceneView.session.pause()
    }

    /// Start to record SceneView content
    public func startRecord() {
    }

    /// Stop to record and Save the recorded video to Photo Library
    public func stopRecord(finished: @escaping (URL) -> Void = { _ in }, isExport: Bool = false) {
        if isExport {
        } else {

        }
    }

    public func makeCoordinator() -> Coordinator {
        return Coordinator()
    }

}
