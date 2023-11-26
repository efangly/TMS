import 'package:flutter/material.dart';
import 'package:temp_noti/src/configs/route.dart' as custom_route;

class MachineList extends StatefulWidget {
  const MachineList({super.key});

  @override
  State<MachineList> createState() => _MachineListState();
}

class _MachineListState extends State<MachineList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 4,
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text('Machine ${index + 1}'),
          subtitle: Text('ห้องยาชั้น ${index + 1} อาคาร ABC'),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: (() {
            Navigator.pushNamed(
              context,
              custom_route.Route.detail,
              arguments: {'id': index + 1},
            );
          }),
        );
      },
    );
  }
}
