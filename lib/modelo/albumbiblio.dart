import 'package:flutter/material.dart';
import 'album.dart';
import 'dart:convert';

class AlbumBiblio extends ChangeNotifier {
  final List<Album> _listaAlbumes = [];
  static String nombreArchivo = "albumes.json";

  AlbumBiblio();

  AlbumBiblio.fromJson(Map<String, dynamic> json) {
    List<dynamic> albumes = json["albumes"];
    for (int i = 0; i < albumes.length; i++) {
      _listaAlbumes.add(Album.fromJson(albumes[i]));
    }
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> albumes = [];
    for (int i = 0; i < _listaAlbumes.length; i++) {
      albumes.add(_listaAlbumes[i].toJson());
    }
    Map<String, dynamic> mapa = {"albumes": albumes};
    return mapa;
  }

  List<Album> get albumes => _listaAlbumes;

  Album getAlbumByIndex(int index) => _listaAlbumes[index];

  void addAlbum(Album album) {
    _listaAlbumes.add(album);
    notifyListeners();
  }

  bool updateAlbum(int index, Album album) {
    if (index >= 0 && index < _listaAlbumes.length) {
      _listaAlbumes[index] = album;
      notifyListeners();
      return true;
    }
    return false;
  }

  bool removeAlbum(int index) {
    if (index >= 0 && index < _listaAlbumes.length) {
      _listaAlbumes.removeAt(index);
      notifyListeners();
      return true;
    }
    return false;
  }
}
