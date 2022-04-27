import 'package:breaking_bad/breaking_bad/model/breaking_bad_model.dart';
import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';
import './breaking_bad.dart';

abstract class BreakingBadViewModel extends State<BreakingBad> {
  INetworkManager manager = NetworkManager(
      isEnableLogger: true,
      options: BaseOptions(baseUrl: "https://breakingbadapi.com/api/"));

  List<BreakingBadModel> charlist = [];
  Future<void> allCharList() async {
    final response = await manager.send("/characters",
        parseModel: BreakingBadModel(), method: RequestType.GET);
    charlist = response.data ?? [];
    setState(() {});
  }
}
