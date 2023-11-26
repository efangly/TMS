import 'package:flutter/material.dart';

class DetailInfo extends StatefulWidget {
  const DetailInfo({super.key});

  @override
  State<DetailInfo> createState() => _DetailInfoState();
}

class _DetailInfoState extends State<DetailInfo> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 6,
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text('Error ${index + 1}'),
          subtitle: const Text('เวลา 00:00'),
          trailing: const Icon(Icons.read_more),
          onTap: (() {
            //
          }),
        );
      },
    );
  }
}
