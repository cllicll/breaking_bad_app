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
                height: context.height * 0.26,
                width: context.width * 0.9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    boxShadow: [
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
                      height: context.height * 0.26,
                      width: context.width * 0.34,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                "${charlist[index].img}",
                              ))),
                    ),
                    Padding(
                      padding: context.paddingNormal,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildRichText(context, index,
                              baslik: "Name : ",
                              aciklama: "${charlist[index].name}"),
                          context.emptySizedHeightBoxLow,
                          buildRichText(context, index,
                              baslik: "Nickname : ",
                              aciklama: "${charlist[index].nickname}"),
                          context.emptySizedHeightBoxLow,
                          buildRichText(context, index,
                              baslik: "Birtday : ",
                              aciklama: "${charlist[index].birthday}"),
                          context.emptySizedHeightBoxLow,
                          // buildRichText(context, index,
                          //     baslik: "Occupation : ",
                          //     aciklama: "${charlist[index].occupation}"),
                          buildRichText(context, index,
                              baslik: "Status : ",
                              aciklama: "${charlist[index].status}"),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }

  RichText buildRichText(BuildContext context, int index,
      {required String baslik, required String aciklama}) {
    return RichText(
      text: TextSpan(
        text: '',
        style: DefaultTextStyle.of(context).style,
        children: <TextSpan>[
          TextSpan(text: baslik, style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: aciklama),
        ],
      ),
    );
  }
}
