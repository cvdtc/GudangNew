class PopularModel{
  String nama;
  String keterangan;
  String image;

  PopularModel(this.nama, this.keterangan, this.image);
}

List<PopularModel> populars = popularsData
    .map((item) =>
    PopularModel(item['nama'], item['keterangan'], item['image']))
    .toList();
var popularsData = [
  {"nama" : "40 Feet", "keterangan" : "Lihat Selengkapnya...", "image" : "assets/"},
  {"nama" : "40 Feet", "keterangan" : "Lihat Selengkapnya...", "image" : "assets/"},
  {"nama" : "40 Feet", "keterangan" : "Lihat Selengkapnya...", "image" : "assets/"},
  {"nama" : "40 Feet", "keterangan" : "Lihat Selengkapnya...", "image" : "assets/"},
  {"nama" : "40 Feet", "keterangan" : "Lihat Selengkapnya...", "image" : "assets/"}
];