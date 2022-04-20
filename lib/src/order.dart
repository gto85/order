import 'product.dart';
class Order {
  final String idOrder;
  final int price;
  final int weight;
  final int volume;
  final int density;
  static Order app = Order.fromidOrder("",0,0,0,0);

  Order.fromidOrder(this.idOrder, this.price, this.weight, this.volume, this.density);

  factory Order(String idOrder,int price,int weight,int volume, int density) {
    if(app.idOrder == ""){
      app = Order.fromidOrder(idOrder,price,weight,volume,density);
      print("Приложение $idOrder запущено price:$price,weight:$weight,volume:$volume,density:$density");
    }
    else{
      app = Order.fromidOrder(idOrder,price,weight,volume,density);
      print("В приложении ${app.idOrder} открыта новая вкладка");
    }
    return app;
  }
  void about(){
    print("Приложение $idOrder");
  }
}
