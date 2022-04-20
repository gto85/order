import 'package:order/order.dart';
import 'package:order/src/order.dart';
import 'package:order/src/price.dart';
import 'package:order/src/product.dart';

void main(List<String> arguments) async {
  List<Product> listProduct=await loadProductFromMap();
  List<Price> listPrice=await loadPriceFromMap();
  Order myOrder1 = Order("Product1",100,200,10,20);
  Order myOrder2 = Order("Product2",300,100,20,80);
  Order myOrder3 = Order("Product3",400,400,40,40);
  Order myOrder4 = Order("Product4",500,500,50,50);
  Order myOrder5 = Order("Product5",600,600,60,60);
  print(myOrder5.idOrder);

  List listResultID=[];
  List listResultWeight=[];
  List listResultVolume=[];
  List listTempID=[];
  List listTempWeight=[];
  List listTempVolume=[];
  List listPlotnVsPrice=[];

  for(var p in listProduct){
    listTempID.add(p.id);
    listTempWeight.add(p.weight);
    listTempVolume.add(p.volume);
    print("density: ${p.density}");
  }

  for(var k=0; k<listTempID.length;k++){
    listResultID.add(combineWithoutRepetitions(listTempID,k+1));
  }
  for(var k=0; k<listTempWeight.length;k++){
    listResultWeight.add(combineWithoutRepetitions(listTempWeight,k+1));
  }
  for(var k=0; k<listTempVolume.length;k++){
    listResultVolume.add(combineWithoutRepetitions(listTempVolume,k+1));
  }

  var resAll=[];
  var resSumm=[];


  getListPriceforPlotnCombine(double plotnost, List<Price>priceList,List<Product>productList,int indexProductList){
    for(var j = 0; j<priceList.length;j++){
      var c = priceList[j].from! > plotnost && plotnost < priceList[j].to!.toInt();
      if(c){
        listPlotnVsPrice.add(priceList[j-1]);
        // print("print ${priceList[j-1].price}");
      }
    }
    return listPlotnVsPrice;
  }

  for(var z = 0; z < listResultWeight.length;z++){
    for(var e = 0; e < listResultWeight[z].length;e++){
      resAll.add(listResultWeight[z][e]/listResultVolume[z][e]);
      stavka(listResultWeight[z][e]/listResultVolume[z][e],listPrice,listProduct,z,listPlotnVsPrice);
    }

  }
  var resAllWeigth=[];
  for(var z = 0; z<listResultWeight.length;z++){
    for(var e=0; e<listResultWeight[z].length;e++){
      resAllWeigth.add(listResultWeight[z][e]);

      // print(resAll[z]);
    }

  }
  // print("listResultID $listResultID");
  // print("resAll.lenght ${resAll.length}");
  // print("resAllWeigth $resAllWeigth");
  // print("resSumm $resSumm");
  // print("listPlotnVsPrice $listPlotnVsPrice");
  for(var el=0;el< resAllWeigth.length; el++){
    // print("Сумма по группам${resAllWeigth[el]*listPlotnVsPrice[el]}");

  }
  // print(List<int>.generate(resAllWeigth.length,(index) => (resAllWeigth[index]*listPlotnVsPrice[index]).toInt()));
  //
  // print("combineWithoutRepetitions = = = ${combineWithoutRepetitions(["a","b","c","d","e"],3)}");


  // for(var i=0; i<listProduct.length;i++){
  //   double itog=0.0;
  //   double plotn=listProduct[i].weight!/listProduct[i].volume!;
  //     for(var j=0; j<listPrice.length;j++){
  //       var c=listPrice[j].from >= plotn && plotn <= listPrice[j].to;
  //       print("${listPrice[j].from} > plotn < ${listPrice[j].to}");
  //
  //       if(c){
  //         print("ПЛОТНОСТЬ = $plotn");
  //         print("цену ${listPrice[j].price} умножаем на вес ${listProduct[i].weight}");
  //         itog=listPrice[j].price*listProduct[i].weight!;
  //         plotn=100000;
  //       }
  //     }
  //   print("Сумма = $itog");
  //   }

}

