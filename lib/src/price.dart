class Price {
  final int? from;
  final int? to;
  final double? price;
  final int? type;

  Price({this.from, this.to,this.price,this.type});

  factory Price.fromJson(Map<String, dynamic> json) {
    return Price(
        from: json['from'],
        to: json['to'],
        price: json['price']!.toDouble(),
        type: json['type']
    );
  }

}