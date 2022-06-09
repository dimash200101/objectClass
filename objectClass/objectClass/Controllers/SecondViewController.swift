//
//  ViewController.swift
//  objectClass
//
//  Created by Rakat Dinmukhammed on 18/05/22.
//  Copyright © 2018 Galym Anuarbek. All rights reserved.
//

import UIKit
import AVKit
import Vision
import EasyPeasy


class SecondViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {

    let resultLabel = UILabel()
    let valueLabel = UILabel()
    let saveButton = UIButton()
    var resString = ""
    var valString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
   
    

    @objc func repFunc() {
        resultLabel.text = resString
        valueLabel.text = valString
    }
    
    @objc func saveDidTap() {
        roomsList1.append(resString)
        //if let roomName = roomName,
            //roomsList1[roomName] != nil {
            //roomsList1[roomName]?.append(resString)
        //}
    }
    
    func setup() {
        let captureSession = AVCaptureSession()
        
        guard let captureDevice = AVCaptureDevice.default(for: .video) else { return }
        guard let input = try? AVCaptureDeviceInput(device: captureDevice) else { return }
        captureSession.addInput(input)
        
        captureSession.startRunning()
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        self.view.layer.addSublayer(previewLayer)
        previewLayer.frame = CGRect(x: 0, y: 150, width: self.view.frame.width, height: self.view.frame.height - 250)
        
        let dataOutput = AVCaptureVideoDataOutput()
        dataOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
        captureSession.addOutput(dataOutput)
        
        valueLabel.font = UIFont.systemFont(ofSize: 20)
        valueLabel.frame = CGRect.init(x: 0, y: 50, width: self.view.frame.width, height: 25)
        valueLabel.textColor = UIColor.black
        valueLabel.textAlignment = NSTextAlignment.left
        self.view.addSubview(valueLabel)
        
        resultLabel.font = UIFont.systemFont(ofSize: 20)
        resultLabel.frame = CGRect.init(x: 0, y: 50, width: self.view.frame.width, height: 25)
        resultLabel.textColor = UIColor.black
        resultLabel.textAlignment = NSTextAlignment.center
        self.view.addSubview(resultLabel)
        
        saveButton.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        saveButton.layer.cornerRadius = 30
        saveButton.backgroundColor = .gray
        self.view.addSubview(saveButton)
        
        resultLabel.easy.layout(
            Left(20),
            Top(110)
        )
        
        valueLabel.easy.layout(
            Top(110),
            Left(0).to(resultLabel)
        )
        
        saveButton.easy.layout(
            CenterX(),
            Bottom(25),
            Width(60),
            Height(60)
        )
        saveButton.addTarget(self, action: #selector(saveDidTap), for: UIControlEvents.touchUpInside)
        saveButton.setImage(UIImage(named: "add"), for: UIControlState.normal)
        
        _ = Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(repFunc), userInfo: nil, repeats: true)
    }
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        guard let model = try? VNCoreMLModel(for: MobileNet().model) else { return }
        let request = VNCoreMLRequest(model: model) { (finReq, err) in
            guard let resl = finReq.results as? [VNClassificationObservation] else { return }
            guard let obs = resl.first else { return }
            if obs.confidence > 0.05 {
                self.resString = "\(obs.identifier.capitalizingFirstLetter())"
                self.valString = ": \(Int(obs.confidence*100))%"
            } else {
                self.resString = ""
                self.valString = ""
            }
        }
        try? VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:]).perform([request])
    }
}

