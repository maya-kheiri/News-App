import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/view/widgets/article_builder.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var searchList = NewsCubit.get(context).serachList;
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(
                          right: 15.0, left: 15, bottom: 10, top: 10),
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        onChanged: (value) {
                          //searchValue = value;
                          NewsCubit.get(context).getSearch(value);
                        },
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(22),
                            hintStyle: TextStyle(color: Colors.white),
                            hintText: 'Search',
                            border: new OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                            filled: true,
                            fillColor: const Color(0xFFB6D3EC),
                            suffixIcon: Container(
                                margin: EdgeInsets.only(right: 10),
                                width: 45.0,
                                height: 45.0,
                                child: new RawMaterialButton(
                                  fillColor: const Color(0xFFEBF2F8),
                                  shape: new CircleBorder(),
                                  elevation: 0.0,
                                  child: Icon(
                                    Ionicons.search_sharp,
                                    size: 23,
                                    color: Colors.black87,
                                  ),
                                  onPressed: () {
                                    //  searchData(searchValue);
                                  },
                                ))),
                      )),
                  Expanded(
                      child: ArticlesBuilder(
                    list: searchList,
                    state: state,
                    isSearch: true,
                  ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
