// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable

import 'package:alaa_flutter/models/task1_model.dart';
import 'package:alaa_flutter/shared/component/component.dart';
import 'package:flutter/material.dart';

class HomeScreen2 extends StatelessWidget {
   HomeScreen2({super.key});
  
 List<ItemModel> modelList=[
    ItemModel(
      imagePath: 'https://static.vecteezy.com/system/resources/previews/015/131/858/original/flat-cartoon-style-shop-facade-front-view-modern-flat-storefront-or-supermarket-design-png.png',
       itemName: 'Lorem Shop',
        itemShiping: 'Free',
         itemPrice: '11.6'),
          ItemModel(
      imagePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTE2a3iIZuM8JTAgrYep5OiX_Okf005lReEHg&usqp=CAU',
       itemName: 'Ipsum Shop',
        itemShiping: 'Free',
         itemPrice: '6.8'),
          ItemModel(
      imagePath: 'https://www.shutterstock.com/image-vector/cartoon-storefront-store-shop-600w-482716420.jpg',
       itemName: 'Dolor Shop',
        itemShiping: '15.6',
         itemPrice: '20.8'),
           ItemModel(
      imagePath: 'https://static.vecteezy.com/system/resources/previews/013/011/120/original/grocery-store-or-supermarket-with-food-product-shelves-racks-dairy-fruits-and-drinks-for-shopping-in-flat-cartoon-hand-drawn-templates-illustration-vector.jpg',
       itemName: 'Art Shop',
        itemShiping: '5.9',
         itemPrice: '10.8'),
           ItemModel(
      imagePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuNBQ_LNK8y5PlyuBP2Kn7eFDnNodygeghXA&usqp=CAU',
       itemName: 'Flower Shop',
        itemShiping: '7.14',
         itemPrice: '10.8'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(20.0),
          ),
          padding: EdgeInsets.all(20.0),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Price Monitor',
                    style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700]),
                  ),
                  Spacer(),
                  Icon(
                    Icons.search,
                    size: 30.0,
                    color: Colors.grey,
                  ),
                  Text(
                    'Search',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25.0,
              ),
              Row(
                children: [
                  Container(
                      width: 100.0,
                      height: 100.0,
                      //
                      child: Image.network(
                          'https://freedesignfile.com/upload/2019/07/Digital-camera-cartoon-vector.jpg')),
                  SizedBox(
                    width: 20.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Photo Camera',
                        style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          Text(
                            'Features',
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 30.0,
                          ),
                          Icon(
                            Icons.menu,
                            size: 25.0,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(6.0),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 164, 224, 224),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                width: 55.0,
                                height: 25.0,
                                child: Text(
                                    textAlign: TextAlign.center,
                                    'IOS'), // , Metering, Focusing
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              Container(
                                padding: EdgeInsets.all(6.0),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 164, 224, 224),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                width: 100.0,
                                height: 25.0,
                                child: Text(
                                    textAlign: TextAlign.center,
                                    'Back focus'), // back focus, Metering, Focusing
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(6.0),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 164, 224, 224),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                width: 65.0,
                                height: 25.0,
                                child: Text(
                                    textAlign: TextAlign.center,
                                    'Metering'), // , ,
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              Container(
                                padding: EdgeInsets.all(6.0),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 164, 224, 224),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                width: 100.0,
                                height: 25.0,
                                child: Text(
                                    textAlign: TextAlign.center,
                                    'Focusing'), // back focus, Metering, Focusing
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Text(
                    'Shopes',
                    style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.grey[700],
                        fontWeight: FontWeight.bold),
                  ),
                  //SizedBox(width: 30.0,),
                  Spacer(),
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_drop_down,
                        color: Colors.grey[600],
                      ),
                      Text(
                        'Best Price',
                        style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20.0,),
              // Row(
              //   children: [
              //     Container(
              //         width: 100.0,
              //         height: 100.0,
              //         //
              //         child: Image.network(
              //             'https://freedesignfile.com/upload/2019/07/Digital-camera-cartoon-vector.jpg')),
              //  SizedBox(width: 20.0,),
              //    Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //      Row(
              //        children: [
              //          Text('Lorem Shop',style: TextStyle(
              //                   fontSize: 22.0,
              //                   color: Colors.grey[600],
              //                   fontWeight: FontWeight.bold),),
              //                   SizedBox(width: 10.0,),
              //                   Icon(Icons.menu,color: Colors.grey,)
              //        ],
              //      ),

              //               Text('Shiping: free',style: TextStyle(
              //               fontSize: 18.0,
              //               color: Colors.grey[600],
              //               ),),
              //                Row(
              //        children: [
              //         Icon(Icons.wifi_2_bar_outlined,color: Colors.grey,),
              //          Text('Go to website',style: TextStyle(
              //                   fontSize: 18.0,
              //                   color: Colors.grey[500],
              //                   ),),
              //                   SizedBox(width: 10.0,),
                                
              //        ],
              //      ),
              //      SizedBox(height: 20.0,),
              //      Container(
              //       width: 100.0,
              //       height: 25.0,
              //       decoration: BoxDecoration( 
              //         color: Colors.amber,
              //         borderRadius: BorderRadius.circular(20.0),
              //       ),
              //       child: Text(textAlign: TextAlign.center,'8.10', style: TextStyle(
              //         fontSize: 20.0,
              //         fontWeight: FontWeight.bold
              //       ),),
              //      ),
              //     ],
              //    ),         
              //   ],
              // ),

              /////////////////////////
              SizedBox(height: 10.0,),
              // Expanded(
              //   child: ListView.separated
              //   (
              //     shrinkWrap: true,
              //     itemBuilder: (context,index)=> buildItem(
              //     imagePath:'https://freedesignfile.com/upload/2019/07/Digital-camera-cartoon-vector.jpg' ,
              //      itemName: 'LoremShop',
              //      itemShiping: 5.5,
              //       itemPrice: 10.8),
              //    separatorBuilder:(context,index)=> Container(height: 1.0,color: Colors.grey,), 
              //    itemCount: 5),
              // ),
            Expanded(
              child: SingleChildScrollView(
                child: ListView.separated(
                  shrinkWrap: true,
                   physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context,index)=>
                  buildItem(
                    imagePath:modelList[index].imagePath,
                    itemName: modelList[index].itemName ,
                    itemShiping: modelList[index].itemShiping,
                    itemPrice: modelList[index].itemPrice,
                    ),
                   separatorBuilder: (ontext,index)=> Container(height: 1.0,color: Colors.grey,),
                    itemCount: modelList.length),
              ),
            )
            ],
          ),
          
        ),
      ),
    );
  }
 
}
