class Productmodel {
  String? name;
  String? description;
  int? price;
  int? stock;
  List? photos;
  List? colors;
  List? sizes;
  List? cattegories;

  Productmodel(this.name, this.description, this.photos, this.stock, this.price, this.sizes, this.colors, this.cattegories);

  Map toJson() => {
        'name': name,
        'description': description,
        'price': price,
        'photos': photos,
        'colors': colors,
        'sizes': sizes,
        'cattegories': cattegories,
        'stock': stock,
      };
}
