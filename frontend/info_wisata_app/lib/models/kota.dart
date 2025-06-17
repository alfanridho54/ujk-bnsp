
class Kota {
  final int idKota;
  final String namaKota;

  Kota({
    required this.idKota,
    required this.namaKota,
  });

  /// Factory constructor untuk membuat instance Kota dari JSON.
  factory Kota.fromJson(Map<String, dynamic> json) {
    return Kota(
      idKota: json['id_kota'],
      namaKota: json['nama_kota'],
    );
  }
}
