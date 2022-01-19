//
//  AlbumDetailsViewController.swift
//  Albumify
//
//  Created by Gregory McQuillan on 1/19/22.
//

import Foundation
import UIKit

class AlbumDetailsViewController: UIViewController {
  var album: Album!

  @IBOutlet weak var artistLabel: UILabel!
  @IBOutlet weak var albumLabel: UILabel!
  @IBOutlet weak var yearLabel: UILabel!
  @IBOutlet weak var trackListTableView: UITableView!
  @IBOutlet weak var coverView: UIView!

  override func viewDidLoad() {
    initUi()
  }

  private func initUi() {
    initTrackTableView()
    initAlbumCover()
  }

  private func initTrackTableView() {
    trackListTableView.register(UITableViewCell.self, forCellReuseIdentifier: Cell.id)
    trackListTableView.dataSource = self
  }

  private func initAlbumCover() {
    artistLabel.text = album.artist
    albumLabel.text = album.title
    yearLabel.text = album.year
    coverView.layer.cornerRadius = 16.0
  }

  enum Cell {
    static let id = "trackCell"
  }
}

extension AlbumDetailsViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    album.tracks.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = trackListTableView.dequeueReusableCell(withIdentifier: Cell.id, for: indexPath)

    cell.textLabel?.text = album.tracks[indexPath.row]

    return cell
  }
}
