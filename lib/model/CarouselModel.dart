class CarouselModel{
  String image;

  CarouselModel(this.image);
}

List<CarouselModel> carousels =
    carouselsData.map((item) => CarouselModel(item['image'])).toList();
var carouselsData = [
  {"image" : "assets/image/banner1.png"},
  {"image" : "assets/image/banner2.png"},
  {"image" : "assets/image/banner3.png"},
];