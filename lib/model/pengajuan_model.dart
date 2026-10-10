
import 'package:flutter/material.dart';

class Pengajuan {
  final String id;
  final String nama;
  final String email;
  final String bidangLayanan;
  final String sesi;
  bool selesaiDitindaklanjuti;

  Pengajuan({
    required this.id,
    required this.nama,
    required this.email,
    required this.bidangLayanan,
    required this.sesi,
    this.selesaiDitindaklanjuti = false,
  });
}

class PengajuanModel extends ChangeNotifier {
  final List<Pengajuan> _daftarPengajuan = [];

  List<Pengajuan> get daftarPengajuan =>
      List.unmodifiable(_daftarPengajuan);

  Pengajuan? cariPengajuan(String id) {
    for (final pengajuan in _daftarPengajuan) {
      if (pengajuan.id == id) {
        return pengajuan;
      }
    }
    return null;
  }

  void tambahPengajuan(Pengajuan pengajuan) {
    _daftarPengajuan.add(pengajuan);
    notifyListeners();
  }

  void ubahStatus(String id) {
    final pengajuan = cariPengajuan(id);

    if (pengajuan != null) {
      pengajuan.selesaiDitindaklanjuti =
          !pengajuan.selesaiDitindaklanjuti;
      notifyListeners();
    }
  }
}