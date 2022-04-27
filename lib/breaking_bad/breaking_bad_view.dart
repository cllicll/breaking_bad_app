import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import './breaking_bad_view_model.dart';

class BreakingBadView extends BreakingBadViewModel {
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            allCharList();
          },
          child: Icon(Icons.add),
        ),
        body: PageView.builder(
          itemCount: charlist.length,
          itemBuilder: (context, index) {
            return Center(
              child: Container(
                height: context.height * 0.3,
                width: context.width * 0.9,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), //color of shadow
                    spreadRadius: 5, //spread radius
                    blurRadius: 7, // blur radius
                    offset: Offset(0, 2),
                  )
                ]),
                child: Row(
                  children: [
                    Container(
                      height: context.height * 0.18,
                      width: context.width * 0.4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(75),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                "${charlist[index].img}",
                              ))),
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}
