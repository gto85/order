import 'dart:convert';
import 'dart:async' show Future;
import 'dart:io';

import 'src/price.dart';
import 'src/product.dart';

Future<String> _loadFile() async {
  File myFile = File("files/data.json");
  String myFileContent = myFile.readAsStringSync();
  return myFileContent;
}
Future loadFileJson() async {
  return await _loadFile();
}
_parseJsonForFile(String jsonString) {
  return jsonDecode(jsonString);
}
Future loadProductFromMap() async {
  List<Product> _productList=[];
  for (var _mass in _parseJsonForFile(await loadFileJson())['products']) {
    _productList.add( Product.fromJson(_mass));
  }
  return _productList;
}
Future loadPriceFromMap() async {
  List<Price> _PriceList=[];
  for (var _mass in _parseJsonForFile(await loadFileJson())['prices']) {
    _PriceList.add( Price.fromJson(_mass));
  }
  return _PriceList;
}
combineWithoutRepetitions(List comboList, comboLength) {
  if (comboLength == 1) {
    return comboList;
  }
  List combos=[];
  List tempCombo=[];
  for(var i=0;i<comboList.length;i++){
    tempCombo = combineWithoutRepetitions(comboList.sublist(i+1),comboLength-1);
    for(var j=0;j<tempCombo.length;j++){
      combos.add(comboList[i]+tempCombo[j]);
    }
  }
  return combos;
}
stavka(double plotnost, List<Price>priceList,List<Product>productList,int indexProductList,List tempColection){
  double mainItog=0;
  double itogStavka=0;
  for(var j = 0; j<priceList.length;j++){
    var c = priceList[j].from! > plotnost && plotnost < priceList[j].to!.toInt();
    if(c){
      // print("ПЛОТНОСТЬ = $plotnost");

      // print("цену ${priceList[j-1].price} умножаем на вес ${productList[indexProductList].weight}");
      tempColection.add(priceList[j-1].price);
      itogStavka=(priceList[j-1].price!*productList[indexProductList].weight!);
      plotnost=100000;
    }
  }
  mainItog=mainItog+itogStavka;
  print("Сумма перевозки= $itogStavka");
  return itogStavka;
}
var facts = [];
fact(n){
  int num = n;
  int factorial = 1;
  for( var i = num ; i >= 1; i-- ) {
    factorial *= i ;
  }
  // print(factorial);
  return factorial;
}

// Число размещений из n по m обозначается Anm и определяется по формуле
// Anm = n·(n − 1)·(n − 2)·...·(n − m + 1) = n!/(n − m)!74

