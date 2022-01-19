//
//  ViewController.swift
//  Albumify
//
//  Created by Gregory McQuillan on 1/19/22.
//

import UIKit

class AlbumListViewController: UITableViewController {
  var albums = [Album]() {
    didSet {
      tableView.reloadData()
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    initUi()
    initAlbums()
  }

  private func initUi() {
    navigationItem.title = "Albums"
  }

  private func initAlbums() {
    guard let root: AlbumRoot = loadJson(from: "albums.json") else {
      return
    }

    albums = root.albums
    print(albums)
  }

  enum Cell {
    static let id = "albumCell"
  }
}

// MARK: - UITableView protocols -
extension AlbumListViewController {
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: Cell.id) ?? UITableViewCell(style: .value1, reuseIdentifier: Cell.id)

    let album = albums[indexPath.row]
    cell.textLabel?.text = album.title
    cell.detailTextLabel?.text = album.year

    return cell
  }

  override func numberOfSections(in tableView: UITableView) -> Int {
    1
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    albums.count
  }

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let album = albums[indexPath.row]
    showDetails(for: album)
  }

  private func showDetails(for album: Album) {
    let storyboard = UIStoryboard(name: "Album", bundle: .main)
    let detailsController = storyboard.instantiateViewController(withIdentifier: "Details") as! AlbumDetailsViewController

    detailsController.album = album

    navigationController?.pushViewController(detailsController, animated: true)
  }
}

