class Product {
  String? id;
  final double? weight;
  final double? volume;
  final int? density;

  Product({this.id, this.weight,this.volume,this.density});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'],
        weight: json['weight'],
        volume: json['volume'],
        density: (json['weight']/json['volume']).toInt()
    );
  }

}