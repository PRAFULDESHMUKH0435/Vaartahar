import 'package:flutter/material.dart';
import 'package:newsapp/Constants/SingleContainer.dart';
import '../CommonHelperServices/FetchAPIData.dart';
class TAB1 extends StatefulWidget {
   TAB1({super.key});

  @override
  State<TAB1> createState() => _TAB1State();
}

class _TAB1State extends State<TAB1> {
   FETCHAPIDATA fetchapidata = FETCHAPIDATA();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
       body: FutureBuilder(
         future: fetchapidata.ForTab1(),
         builder: (context,snapshot){
           if(snapshot.connectionState==ConnectionState.waiting){
             return Center(child: CircularProgressIndicator());
           }else if(snapshot.connectionState==ConnectionState.done ||snapshot.connectionState==ConnectionState.active){
             return ListView.builder(
                 itemCount: fetchapidata.list1.length,
                 itemBuilder: (context,index){
                   // print("Length Is ${fetchapidata.list1.length}");
                   return SingleContainer(
                     url: fetchapidata.list1[index].url.toString(),
                     title: fetchapidata.list1[index].title.toString(),
                     content: fetchapidata.list1[index].content.toString(),
                     description: fetchapidata.list1[index].description.toString(),
                     urlToImage: fetchapidata.list1[index].urlToImage.toString(),
                   );
              });
           }else{
             return Text("Something Went Wrong");
           }
         },
       ),
    );
  }
}
