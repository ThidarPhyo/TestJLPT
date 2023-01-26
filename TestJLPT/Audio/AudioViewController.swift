//
//  AudioViewController.swift
//  TestJLPT
//
//  Created by cmStudent on 24/12/2022.
//

import AVFoundation
import UIKit

class AudioViewController: UIViewController {

    public var position: Int = 0
    public var songs: [Song] = []

    @IBOutlet var myView: UIView!
    
    
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var holder: UIView!
    
    @IBOutlet weak var scroll: UIScrollView!
    
    @IBOutlet weak var myText: UILabel!
    
    var player: AVAudioPlayer?
    var audio:AVPlayer!

    // User Interface elements

    private let albumImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private let songNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0 // line wrap
        return label
    }()

    private let artistNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0 // line wrap
        return label
    }()

    private let albumNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0 // line wrap
        return label
    }()

    let playPauseButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myText.text = songs[position].artistName
        configure()
    }
    
    
    @IBAction func backBtnAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if holder.subviews.count == 0 {
            //configure()
        }
    }

    func configure() {
        // set up player
        let song = songs[position]

        let urlString = Bundle.main.path(forResource: song.trackName, ofType: "mp3")

        do {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)

            guard let urlString = urlString else {
                print("urlstring is nil")
                return
            }

            player = try AVAudioPlayer(contentsOf: URL(string: urlString)!)

            guard let player = player else {
                print("player is nil")
                return
            }
            player.volume = 0.5

            player.play()
        }
        catch {
            print("error occurred")
        }

        // set up user interface elements

        // album cover
//        albumImageView.frame = CGRect(x: 10,
//                                      y: 10,
//                                      width: holder.frame.size.width-20,
//                                      height: holder.frame.size.width-20)
//        albumImageView.image = UIImage(named: song.imageName)
//        holder.addSubview(albumImageView)

        // Labels: Song name, album, artist
//        songNameLabel.frame = CGRect(x: 10,
//                                     y: albumImageView.frame.size.height + 10,
//                                     width: holder.frame.size.width-20,
//                                     height: 70)
//        albumNameLabel.frame = CGRect(x: 10,
//                                     y: albumImageView.frame.size.height + 10 + 70,
//                                     width: holder.frame.size.width-20,
//                                     height: 70)
//        artistNameLabel.frame = CGRect(x: 10,
//                                       y: backView.frame.size.height + 60,
//                                       width: myView.frame.size.width-20,
//                                       height: UIScreen.main.bounds.height+44)

//        songNameLabel.text = song.name
//        albumNameLabel.text = song.albumName
//        artistNameLabel.text = song.artistName
//
//        myView.addSubview(songNameLabel)
//        myView.addSubview(albumNameLabel)
//        myView.addSubview(artistNameLabel)

        // Player controls
        let nextButton = UIButton()
        let backButton = UIButton()

        // Frame
        //let yPosition = artistNameLabel.frame.origin.y + 70 + 20
        let size: CGFloat = 70

        playPauseButton.frame = CGRect(x: (myView.frame.size.width - size) / 2.0,
                                       y: myView.frame.size.height-180,
                                       width: size,
                                       height: size)

        nextButton.frame = CGRect(x: myView.frame.size.width - size - 20,
                                  y: myView.frame.size.height-180,
                                  width: size,
                                  height: size)

        backButton.frame = CGRect(x: 20,
                                  y: myView.frame.size.height-180,
                                  width: size,
                                  height: size)

        // Add actions
        playPauseButton.addTarget(self, action: #selector(didTapPlayPauseButton), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)

        // Styling

        playPauseButton.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
        backButton.setBackgroundImage(UIImage(systemName: "backward.fill"), for: .normal)
        nextButton.setBackgroundImage(UIImage(systemName: "forward.fill"), for: .normal)

        playPauseButton.tintColor = .black
        backButton.tintColor = .black
        nextButton.tintColor = .black

        myView.addSubview(playPauseButton)
        myView.addSubview(nextButton)
        myView.addSubview(backButton)

        // slider
        let slider = UISlider(frame: CGRect(x: 20,
                                            y: myView.frame.size.height-60,
                                            width: myView.frame.size.width-40,
                                            height: 50))
        slider.value = 0.5
        slider.addTarget(self, action: #selector(didSlideSlider(_:)), for: .valueChanged)
        myView.addSubview(slider)
    }

    @objc func didTapBackButton() {
        if position > 0 {
            position = position - 1
            player?.stop()
            for subview in myView.subviews {
                subview.removeFromSuperview()
            }
            configure()
        }
    }

    @objc func didTapNextButton() {
        if position < (songs.count - 1) {
            position = position + 1
            player?.stop()
            for subview in myView.subviews {
                subview.removeFromSuperview()
            }
            configure()
        }
    }

    @objc func didTapPlayPauseButton() {
        if player?.isPlaying == true {
            // pause
            player?.pause()
            // show play button
            playPauseButton.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal)

            // shrink image
//            UIView.animate(withDuration: 0.2, animations: {
//                self.albumImageView.frame = CGRect(x: 30,
//                                                   y: 30,
//                                                   width: self.myView.frame.size.width-60,
//                                                   height: self.myView.frame.size.width-60)
//            })
        }
        else {
            // play
            player?.play()
            playPauseButton.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)

            // increase image size
//            UIView.animate(withDuration: 0.2, animations: {
//                self.albumImageView.frame = CGRect(x: 10,
//                                              y: 10,
//                                              width: self.myView.frame.size.width-20,
//                                              height: self.myView.frame.size.width-20)
//            })
        }
    }

    @objc func didSlideSlider(_ slider: UISlider) {
        let value = slider.value
        player?.volume = value
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let player = player {
            player.stop()
        }
    }

}
