
import 'package:flutter/material.dart';
import 'dart:math' as math;



class SliverAppBarDelegateApp extends SliverPersistentHeaderDelegate {
   SliverAppBarDelegateApp({required this.minHeight,required this.maxHeight,
      // required this.child,
      required this.child2,
      // required this.child3,
      // this.title,this.url,this.from,this.hintext,this.searchBar,this.isCamera,this.backButton,this.fontWeight,
      // this.getNotiLength,this.isSearch,this.onSubmitted,this.onback,this.scaffoldKey,this.searchController
      
    });
  // final String title, url, from, hintext;
  // final Widget searchBar;
  // final bool isCamera;
  // final bool isSearch;
  // final bool backButton;
  // final fontWeight;
  // final scaffoldKey;
  // final searchController;
  // final onSubmitted;
  // final getNotiLength;
  // final Function onback;

    final double minHeight;
    final double maxHeight;
    // final Widget child;
    final Widget child2;
    // final Widget child3;

    @override
    //  double get minExtent => minHeight;
    double get minExtent => kToolbarHeight;
    @override
    //  double get maxExtent => math.max(maxHeight, minHeight);
   double get maxExtent => maxHeight;

    @override
     Widget build(BuildContext context,
      double shrinkOffset,
      bool overlapsContent) {
      bool scrolled = shrinkOffset > 0;
      var opacity= shrinkOffset/maxHeight;
    
    // Container(child:  ImageVal().imageVal(url: data[1]['PATH']) ,
    // height: 500,);

    return 
    Stack(
      children: [
        // child2,
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: child2,
        ),
        AppBar(
        backgroundColor:scrolled?Colors.red.withOpacity(opacity): Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        actions: <Widget>[
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
                                  // suffixIcon: searchController.text.isEmpty
                                  //     ? isCamera == true
                                  //         ? Container(
                                  //             child: IconCamera(),
                                  //           )
                                  //         : null
                                  //     : Container(
                                  //         margin: EdgeInsets.all(10.0),
                                  //         decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blueGrey[300]),
                                  //         child: InkWell(
                                  //           onTap: () {
                                  //             searchController.clear();
                                  //           },
                                  //           child: Icon(
                                  //             Icons.clear,
                                  //             size: 10.0,
                                  //             color: Colors.white,
                                  //           ),
                                  //         ),
                                  //       ),
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
    )
      ],
    );
    // Stack(children: [
    //   child2,
    //   child
    // ],);
      }

    // @override
    // bool shouldRebuild(SliverAppBarDelegateApp oldDelegate) {
    //   return maxHeight != oldDelegate.maxHeight ||
    //   minHeight != oldDelegate.minHeight ||
    //    child != oldDelegate.child;
    // }
      @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
   }