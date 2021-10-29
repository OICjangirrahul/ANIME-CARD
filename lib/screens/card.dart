import 'package:flutter/material.dart';
import 'package:ted/model/data.dart';
import 'package:ted/model/dataoprations.dart';

class CARD extends StatelessWidget {
  const CARD({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: _crateappbar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _allpro(),
             
            ],
          ),
        ),
      ),
    );
  }
}

_crateappbar() {
  return AppBar(
    backgroundColor: Colors.grey,
    title: const Text(
      "ANIME",
      style: TextStyle(fontSize: 28),
    ),
    leading: Icon(Icons.menu),
    actions: [Icon(Icons.settings)],
  );
}

Widget _createcard(String imgUrl, String tit, String subtit) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SizedBox(
        
        // width: size.width * 0.95,
        // height: size.height * 0.27,
        width: 350,
        height: 200,
        child: Card(
          elevation: 7,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(imgUrl),
              Center(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tit,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              subtit,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.more_vert,
                                  color: Colors.white,
                                )),
                            Text('10:00',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ],
  );
}

_allpro() {
  //call data

  List<Data> datas = DataOparations.filldata();
  List<Widget> datawigets = datas.map((e) {
    Widget datawiget = _createcard(e.imgUrl, e.tit, e.subtit);
    return datawiget;
  }).toList();
  return Container(
      margin: EdgeInsets.only(top: 10, left: 30),
      child: Wrap(
        children: datawigets,
      ));
}
