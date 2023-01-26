//
//  ListAudioViewController.swift
//  TestJLPT
//
//  Created by cmStudent on 24/12/2022.
//

import UIKit

class ListAudioViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var table: UITableView!

    var songs = [Song]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureSongs()
        table.delegate = self
        table.dataSource = self
    }
    
    @IBAction func backBtnAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func configureSongs() {
        songs.append(Song(name: "Background music",
                          albumName: "123 Other",
                          artistName: "RnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnad   RnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRna doRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRna doRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnadoRnado¥¥¥¥¥¥¥",
                          imageName: "cover1",
                          trackName: "circles"))
        songs.append(Song(name: "Havana",
                          albumName: "Havana album",
                          artistName: "Camilla Cabello",
                          imageName: "cover1",
                          trackName: "circles"))
        songs.append(Song(name: "Viva La Vida",
                          albumName: "123 Something",
                          artistName: "Coldplay",
                          imageName: "cover1",
                          trackName: "circles"))
        songs.append(Song(name: "Background music",
                          albumName: "123 Other",
                          artistName: "Rnado",
                          imageName: "cover1",
                          trackName: "circles"))
    }

    // Table

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let song = songs[indexPath.row]
        // configure
        cell.textLabel?.text = song.name
//        cell.detailTextLabel?.text = song.albumName
//        cell.accessoryType = .disclosureIndicator
//        cell.imageView?.image = UIImage(named: song.imageName)
//        cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 18)
//        cell.detailTextLabel?.font = UIFont(name: "Helvetica", size: 17)

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        // present the player
        let position = indexPath.row
        guard let vc = storyboard?.instantiateViewController(identifier: "player") as? AudioViewController else {
            return
        }
        vc.songs = songs
        vc.position = position
        present(vc, animated: true)
    }


}

struct Song {
    let name: String?
    let albumName: String?
    let artistName: String?
    let imageName: String?
    let trackName: String
}
