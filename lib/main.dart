import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sliverapp/silverDelegate.dart';


//nak banner sluder tu boleh jadi height dia tinggi lagi, tk nak kecik mcm tu.
// ada dua cara aku guna,SliverPersistentHeader and silverappbar
//SliverPersistentHeader boleh ubah banner's height but tak boleh click and slide banner tu
//silverappbar boleh click and slide banner tu, but height tk boleh ubah


void main() => runApp(MaterialApp(
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var top = 0.0;
  int bannerIndex = 0;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

   List<Widget> buildList(int count) {
      List<Widget> listItems =[];
  
      for (int i = 0; i < count; i++) {
        listItems.add(Padding(padding: EdgeInsets.all(20.0),
            child: Text(
                'Item ${i.toString()}',
                style: TextStyle(fontSize: 25.0)
            )
        ));
      }
  
      return listItems;
    }

   Widget bannerSlider() {
    return
    Container(
        child: Stack(alignment: Alignment.bottomCenter, children: [
      CarouselSlider(
        options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 5),
            enlargeCenterPage: false,
            aspectRatio: 2 / 1  ,
            viewportFraction: 1.0,
            disableCenter: true,
            onPageChanged: (index, reason) {
              setState(() {
                bannerIndex = index;
              });
            }),
        items: [
          GestureDetector(
            child: Image.network(
                        "https://images.unsplash.com/photo-1542601098-3adb3baeb1ec?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=5bb9a9747954cdd6eabe54e3688a407e&auto=format&fit=crop&w=500&q=60",
                        fit: BoxFit.cover,
                      ),
                      onTap: ()=>print('clicked'),
          ),
          GestureDetector(
            child: Image.network(
                        "https://www.voicesofyouth.org/sites/voy/files/images/2019-10/atmosphere-blue-sky-clouds-912110.jpg",
                        fit: BoxFit.cover,
                      ),
                      onTap: ()=>print('clicked 2'),
          )
        ]
      ),
    ]));
 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: 
        // SafeArea(
        //   child: NestedScrollView(
        //       headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        //   return <Widget>[
        //     SliverAppBar(
        //         expandedHeight: 180.0,
        //         floating: false,
        //         pinned: true,
        //         actions: [
        //            Container(
        //         margin: EdgeInsets.only(top: 9.0, bottom: 9.0),
        //         padding: EdgeInsets.only(left: 0.0),
        //         width:68,// ResponsiveFlutter.of(context).wp(68),
        //         child:  Container(
        //           child: Row(
        //             children: <Widget>[
        //               Expanded(
        //                 child: Container(
        //                   decoration: BoxDecoration(
        //                     borderRadius: BorderRadius.circular(30),
        //                     color: Colors.white,
        //                   ),
        //                   child: Padding(
        //                     padding: const EdgeInsets.only(top: 3.0),
        //                     child: TextField(
        //                         enabled: true,
        //                         style: TextStyle(fontSize: 12.0, color: Colors.black),
        //                         decoration: InputDecoration(
        //                             prefixIcon: Container(
        //                                 child: Icon(
        //                               Icons.search,
        //                               size: 23,
        //                             )),
        //                             // suffixIcon: searchController.text.isEmpty
        //                             //     ? isCamera == true
        //                             //         ? Container(
        //                             //             child: IconCamera(),
        //                             //           )
        //                             //         : null
        //                             //     : Container(
        //                             //         margin: EdgeInsets.all(10.0),
        //                             //         decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blueGrey[300]),
        //                             //         child: InkWell(
        //                             //           onTap: () {
        //                             //             searchController.clear();
        //                             //           },
        //                             //           child: Icon(
        //                             //             Icons.clear,
        //                             //             size: 10.0,
        //                             //             color: Colors.white,
        //                             //           ),
        //                             //         ),
        //                             //       ),
        //                             focusedBorder: InputBorder.none,
        //                             enabledBorder: InputBorder.none,
        //                             errorBorder: InputBorder.none,
        //                             disabledBorder: InputBorder.none,
        //                             contentPadding: EdgeInsets.fromLTRB(0.0, 0.0, 22.0, 0.0),
        //                             hintText:'search',// this.hintext ?? Global().searchHint,
        //                             hintStyle: TextStyle(fontSize: 12.0, color: Colors.black),),
        //                         onEditingComplete: null),
        //                   ),
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //         ],
        //         flexibleSpace: LayoutBuilder(
        //             builder: (BuildContext context, BoxConstraints constraints) {
        //           // print('constraints=' + constraints.toString());
        //           top = constraints.biggest.height;
        //           return FlexibleSpaceBar(
        //               centerTitle: true,
        //               title: AnimatedOpacity(
        //                   duration: Duration(milliseconds: 300),
        //                   //opacity: top == MediaQuery.of(context).padding.top + kToolbarHeight ? 1.0 : 0.0,
        //                   opacity: 1.0,
        //                   child: Text(
        //                     top.toString(),
        //                     style: TextStyle(fontSize: 12.0),
        //                   )),
        //               background:bannerSlider()
        //               //  Image.network(
        //               //   "https://images.unsplash.com/photo-1542601098-3adb3baeb1ec?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=5bb9a9747954cdd6eabe54e3688a407e&auto=format&fit=crop&w=500&q=60",
        //               //   fit: BoxFit.cover,
        //               // )
        //               );
        //         })),
        //   ];
        //       },body: ListView.builder(
        //   itemCount: 100,
        //   itemBuilder: (context,index){
        //     return Text("List Item: " + index.toString());
        //   },
        //       ),
        //     ),
        // ));
  SafeArea(
    child: CustomScrollView(
      slivers: [

      // SliverPersistentHeader(
      //         pinned: true,
      //         delegate: SliverAppBarDelegateApp(
      //         minHeight: 0.0,
      //         maxHeight: 180.0, //control height banner 
      //         child2: bannerSlider()
      // ),),

      SliverAppBar(
                expandedHeight: 236,
                floating: false,
                pinned: true,
                actions: [
                Container(
                margin: EdgeInsets.only(top: 9.0, bottom: 9.0),
                padding: EdgeInsets.only(left: 0.0),
                width:68,// ResponsiveFlutter.of(context).wp(68),
                child:  Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 3.0),
                            child: TextField(
                                enabled: true,
                                style: TextStyle(fontSize: 12.0, color: Colors.black),
                                decoration: InputDecoration(
                                    prefixIcon: Container(
                                        child: Icon(
                                      Icons.search,
                                      size: 23,
                                    )),
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    contentPadding: EdgeInsets.fromLTRB(0.0, 0.0, 22.0, 0.0),
                                    hintText:'search',// this.hintext ?? Global().searchHint,
                                    hintStyle: TextStyle(fontSize: 12.0, color: Colors.black),),
                                onEditingComplete: null),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
                SizedBox(width: 250,),
                 Icon(Icons.menu)
                ],
                flexibleSpace:
                FlexibleSpaceBar(
            background: Column(children: <Widget>[
              Center(
                child: SizedBox(
                  child: Center(
                    child: Stack(
                      children: <Widget>[
                        CarouselSlider(
                            options: CarouselOptions(
                                autoPlay: true,
                                autoPlayInterval: Duration(seconds: 5),
                                enlargeCenterPage: false,
                                aspectRatio: 2/1.2,
                                viewportFraction: 1.0,
                                disableCenter: true,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    bannerIndex = index;
                                  });
                                }),
                            items: [
                              GestureDetector(
                                child: Image.network(
                                  "https://images.unsplash.com/photo-1542601098-3adb3baeb1ec?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=5bb9a9747954cdd6eabe54e3688a407e&auto=format&fit=crop&w=500&q=60",
                                  fit: BoxFit.cover,
                                ),
                                onTap: () => print('clicked'),
                              ),
                              GestureDetector(
                                child: Image.network(
                                  "https://www.voicesofyouth.org/sites/voy/files/images/2019-10/atmosphere-blue-sky-clouds-912110.jpg",
                                  fit: BoxFit.cover,
                                ),
                                onTap: () => print('clicked 2'),
                              )
                            ]),
                      ], //<Widget>[]
                    ), //Stack
                  ), //Center
                ), //SizedBox
              ) //Cen
            ]))
          ),
                //  LayoutBuilder(
                //     builder: (BuildContext context, BoxConstraints constraints) {
                //   top = constraints.biggest.height;
                //   return FlexibleSpaceBar(
                //       centerTitle: true,
                //       title: AnimatedOpacity(
                //           duration: Duration(milliseconds: 300),
                //           opacity: 1.0,
                //           child: Text(
                //             top.toString(),
                //             style: TextStyle(fontSize: 12.0),
                //           )),
                //       background: bannerSlider()
                //       // Image.network(
                //       //   "https://images.unsplash.com/photo-1542601098-3adb3baeb1ec?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=5bb9a9747954cdd6eabe54e3688a407e&auto=format&fit=crop&w=500&q=60",
                //       //   fit: BoxFit.cover,
                //       // )
                //       );
                // })),
                  
                  SliverList(
                    delegate: SliverChildListDelegate(buildList(50))
                ),
    ],),
  ));
  
  }
}