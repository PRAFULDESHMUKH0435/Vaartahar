import 'package:flutter/material.dart';
import 'package:newsapp/Constants/SingleContainer.dart';

import '../CommonHelperServices/FetchAPIData.dart';
class TAB3 extends StatelessWidget {
  TAB3({super.key});
  FETCHAPIDATA fetchapidata = FETCHAPIDATA();

  @override
  Widget build(BuildContext context) {
    print(fetchapidata.list3.length);
    return Scaffold(
      backgroundColor: Colors.grey,
      body: FutureBuilder(
        future: fetchapidata.ForTab3(),
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }else if(snapshot.connectionState==ConnectionState.done ||snapshot.connectionState==ConnectionState.active){
            return ListView.builder(
                itemCount: fetchapidata.list3.length,
                itemBuilder: (context,index){
                  print("Length Is ${fetchapidata.list3.length}");
                   return SingleContainer(
                     url: fetchapidata.list3[index].url.toString(),
                     title: fetchapidata.list3[index].title.toString(),
                     content: fetchapidata.list3[index].content.toString(),
                     description: fetchapidata.list3[index].description.toString(),
                     urlToImage: fetchapidata.list3[index].urlToImage.toString(),
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