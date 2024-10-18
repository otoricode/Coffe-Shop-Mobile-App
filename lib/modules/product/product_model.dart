import 'dart:convert';

import 'package:flutter/foundation.dart';

abstract class ProductRepo {
  Future<List<ProductModel>> getProductList();
  // Future<List<ProductModel>> getProductDetail();
}

class ProductModel {
  final int id;
  final String name;
  final String roastType;
  final String image;
  final double rating;
  final double price;
  final String description;
  final List<String> sizeOptions;
  final String selectedSize;
  final int quantity;
  ProductModel({
    required this.id,
    required this.name,
    required this.roastType,
    required this.image,
    required this.rating,
    required this.price,
    required this.description,
    required this.sizeOptions,
    required this.selectedSize,
    required this.quantity,
  });

  ProductModel copyWith({
    int? id,
    String? name,
    String? roastType,
    String? image,
    double? rating,
    double? price,
    String? description,
    List<String>? sizeOptions,
    String? selectedSize,
    int? quantity,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      roastType: roastType ?? this.roastType,
      image: image ?? this.image,
      rating: rating ?? this.rating,
      price: price ?? this.price,
      description: description ?? this.description,
      sizeOptions: sizeOptions ?? this.sizeOptions,
      selectedSize: selectedSize ?? this.selectedSize,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'roast_type': roastType,
      'image': image,
      'rating': rating,
      'price': price,
      'description': description,
      'size_options': sizeOptions,
      'selected_size': selectedSize,
      'quantity': quantity,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      roastType: map['roast_type'] ?? '',
      image: map['image'] ?? '',
      rating: map['rating']?.toDouble() ?? 0.0,
      price: map['price']?.toDouble() ?? 0.0,
      description: map['description'] ?? '',
      sizeOptions: List<String>.from(map['size_options']),
      selectedSize: map['selected_size'] ?? '',
      quantity: map['quantity']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, roastType: $roastType, image: $image, rating: $rating, price: $price, description: $description, sizeOptions: $sizeOptions, selectedSize: $selectedSize, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductModel &&
        other.id == id &&
        other.name == name &&
        other.roastType == roastType &&
        other.image == image &&
        other.rating == rating &&
        other.price == price &&
        other.description == description &&
        listEquals(other.sizeOptions, sizeOptions) &&
        other.selectedSize == selectedSize &&
        other.quantity == quantity;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        roastType.hashCode ^
        image.hashCode ^
        rating.hashCode ^
        price.hashCode ^
        description.hashCode ^
        sizeOptions.hashCode ^
        selectedSize.hashCode ^
        quantity.hashCode;
  }
}
