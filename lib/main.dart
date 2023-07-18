import 'package:flutter/material.dart';
import 'dart:math';
void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        title: Text("تطابق صورة"),
        backgroundColor: Colors.indigo[800],
        centerTitle: true,
      ),
      body: ImagePage(),
    ),
  )
  );
}
class ImagePage extends StatefulWidget{
  @override
  _ImagePage createState() => _ImagePage();

}

class _ImagePage extends State<ImagePage>{
  var leftimage=4;
  var rightimage=1;

  void ChangeImage(){
    leftimage=Random().nextInt(8)+1;
    rightimage=Random().nextInt(8)+1;
  }
  @override
  Widget build(BuildContext context) {

    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:[
          Text(
            leftimage == rightimage ? "مبروك لقد نجحت" :"حاول مرة اخرى",
            style:
            TextStyle(
            color: Colors.white,
            fontSize: 42,
            ),
          ),
          Row(
            children: [
              Expanded(
                child:ElevatedButton(
                style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                elevation: 0,
               ),
                  onPressed: (){
                  setState(() {
                    if(leftimage!=rightimage)
                   ChangeImage();
                  });
                  },
                  child: Image(image: AssetImage("images/image-$leftimage.png"),),),
              ),
              Expanded(
                 child: ElevatedButton(
                   style: ElevatedButton.styleFrom(
                     elevation: 0,
                     backgroundColor: Colors.indigo,
                   ),
                   onPressed: (){
                     setState(() {
                       if(rightimage!=leftimage)
                       ChangeImage();
                     });
                   },
                   child: Image(image: AssetImage("images/image-$rightimage.png"),),),
                 ),

            ],
          ),
        ]
      );
  }

}