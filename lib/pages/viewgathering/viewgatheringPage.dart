import 'package:flutter/material.dart';
import 'package:projectinit/models/gatheringModel.dart';

var gatheringData = <GatheringModel>[
  GatheringModel(
      date: "2020-02-03",
      time: "10:08 am",
      location: "Koteshor, Kathmandu",
      type: "Cafe groups"),
  GatheringModel(
      date: "2022-02-03",
      time: "10:08 am",
      location: "Gongabu, Kathmandu",
      type: "Online Groups"),
  GatheringModel(
      date: "2022-02-03",
      time: "10:08 am",
      location: "Ranibari, Kathmandu",
      type: "Waiting groups"),
  GatheringModel(
      date: "2022-02-03",
      time: "10:08 am",
      location: "Samakhushi, Kathmandu",
      type: "Online groups"),
];

class ViewGathering extends StatefulWidget {
  const ViewGathering({Key? key}) : super(key: key);

  @override
  State<ViewGathering> createState() => _ViewGatheringState();
}

class _ViewGatheringState extends State<ViewGathering> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Registerd Gatheirng"),
      ),
      body: SafeArea(
          child: Column(
        children: List.generate(
            gatheringData.length,
            (index) => ListTile(
                title: Text(gatheringData[index].type!),
                trailing: Text(gatheringData[index].date!),
                subtitle: Text(gatheringData[index].location!))),
      )),
    );
  }
}
