class NewProductsModel {
  int? id;
  String? title;
  String? price;
  String? description;
  String? category;
  String? image;

  NewProductsModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
  });

  NewProductsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'].toString();
    description = json['description'];
    category = json['category'];
    image = json['image'];
  }

  static List<NewProductsModel> productsFromSnapshot(List productSnapshot) {
    return productSnapshot.map((data) {
      return NewProductsModel.fromJson(data);
    }).toList();
  }
}
