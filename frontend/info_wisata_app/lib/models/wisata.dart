class Wisata {
  final int id;
  final String nama;
  final String deskripsi;
  final String? alamat;
  final String? urlFoto;

  Wisata({
    required this.id,
    required this.nama,
    required this.deskripsi,
    this.alamat,
    this.urlFoto,
  });

  factory Wisata.fromJson(Map<String, dynamic> json) {
    return Wisata(
      id: json['id_wisata'],
      nama: json['nama_wisata'],
      deskripsi: json['deskripsi'],
      alamat: json['alamat'],
      urlFoto: json['url_foto'],
    );
  }
}