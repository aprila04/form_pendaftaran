
import 'package:flutter/material.dart';
import '../pages/detail_pengajuan_page.dart';
import 'kerangka_navigasi.dart';

class AppRoutes {
  static const String beranda = '/';
  static const String detailpengajuan = '/detail-pengajuan';

  static Map<String, WidgetBuilder> daftarRoute() {
    return {
      beranda: (context) => const KerangkaNavigasi(),
    };
  }

  static Route<dynamic>? bentukRoute(RouteSettings settings) {
    if (settings.name == detailpengajuan) {
      final pengajuanId = settings.arguments;

      if (pengajuanId is String) {
        return MaterialPageRoute(
          builder: (context) => DetailPengajuanPage(
            pengajuanId: pengajuanId,
          ),
        );
      }
    }

    return null;
  }

  static Route<dynamic> routeTidakDikenal(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: const Text('Route Tidak Ditemukan'),
        ),
        body: Center(
          child: Text('Route ${settings.name} belum terdaftar.'),
        ),
      ),
    );
  }
}