import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:news_app/constanses/categories_map.dart';
import 'package:news_app/view/screens/news_screen.dart';
import 'package:news_app/view/screens/search_screen.dart';
import 'package:news_app/view/widgets/primaryText.dart';
import 'package:ionicons/ionicons.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white38,
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (c) => SearchScreen()));
            },
            child: Container(
                margin: EdgeInsets.only(right: 20),
                height: 55,
                width: 55,
                decoration: BoxDecoration(
                    color: Color(0xFFEBF2F8),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Icon(
                  Ionicons.search_sharp,
                  size: 25,
                )),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25,
              ),
              Wrap(children: [
                PrimaryText(
                  text: 'Discover the lastest',
                  alignment: Alignment.centerLeft,
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                ),
                PrimaryText(
                  text: 'News',
                  alignment: Alignment.centerLeft,
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                ),
              ]),
              SizedBox(
                height: 15,
              ),
              PrimaryText(
                text:
                    '${DateTime.now().hour} : ${DateTime.now().minute}   |   ${DateTime.now().day} / ${DateTime.now().month} / ${DateTime.now().year}',
                textColor: Colors.grey,
                alignment: Alignment.centerLeft,
              ),
              Divider(
                thickness: 1.2,
                height: 45,
                color: Colors.blueGrey.withOpacity(0.4),
              ),
              PrimaryText(
                text: 'Choose Topic',
                alignment: Alignment.centerLeft,
                textColor: Colors.blueGrey,
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: categories.length,
                      itemBuilder: (c, index) => InkWell(
                            onTap: () {
                              // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context ) => SportScreen()));
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (co) {
                                if (categories[index]['name'] == "Sport") {
                                  return NewsScreen(
                                    categoryName: "Sport",
                                  );
                                } else if (categories[index]['name'] ==
                                    "Science") {
                                  return NewsScreen(
                                    categoryName: "Science",
                                  );
                                } else {
                                  return NewsScreen(
                                    categoryName: "Business",
                                  );
                                }
                              }));
                            },
                            child: Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(top: 25),
                              height: 95,
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                  color: categories[index]['color'],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(23))),
                              child: Row(
                                children: [
                                  Container(
                                      height: 60,
                                      width: 60,
                                      padding: EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(80)),
                                          color: Color(0xFF85B9DB)
                                              .withOpacity(0.5)),
                                      child: Image.network(
                                        categories[index]['icon'],
                                        fit: BoxFit.cover,
                                      )),
                                  SizedBox(
                                    width: 25,
                                  ),
                                  PrimaryText(
                                    alignment: Alignment.centerLeft,
                                    text: categories[index]['name'],
                                    fontWeight: FontWeight.w500,
                                  )
                                ],
                              ),
                            ),
                          )))
            ],
          ),
        ),
      ),
    );
  }
}
