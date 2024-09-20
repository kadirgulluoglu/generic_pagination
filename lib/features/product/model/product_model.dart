import 'dart:convert';

ProductModel productFromJson(dynamic json) => ProductModel.fromJson(json);

String productToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  final List<Product>? product;
  final int? totalCount;

  ProductModel({
    this.product,
    this.totalCount,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        product: json["product"] == null
            ? []
            : List<Product>.from(
                json["product"]!.map((x) => Product.fromJson(x))),
        totalCount: json["totalCount"],
      );

  Map<String, dynamic> toJson() => {
        "product": product == null
            ? []
            : List<dynamic>.from(product!.map((x) => x.toJson())),
        "totalCount": totalCount,
      };
}

class Product {
  final int? id;
  final String? title;
  final String? description;
  final String? price;
  final Brand? brand;

  Product({
    this.id,
    this.title,
    this.description,
    this.price,
    this.brand,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        price: json["price"].toString(),
        brand: json["brand"] == null ? null : Brand.fromJson(json["brand"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "price": price,
        "brand": brand?.toJson(),
      };
}

class Brand {
  final int? id;
  final String? name;

  Brand({
    this.id,
    this.name,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
