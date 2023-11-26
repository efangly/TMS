import 'package:flutter/material.dart';
import 'package:temp_noti/src/widgets/detail/detailinfo.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    return Scaffold(
      appBar: AppBar(
        title: Text('Machine ${arguments['id']}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'อุณหภูมิ : 0.00',
                style: TextStyle(fontSize: 40),
              ),
              const Divider(height: 20),
              const Text(
                'ความชื้น : 0.00',
                style: TextStyle(fontSize: 40),
              ),
              const Divider(height: 25),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('ID : ABCDEFGH '),
                  SizedBox(width: 40),
                  Text('Name : ABCDEFGH'),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Loc : ห้องยาชั้น ${arguments['id']}'),
                  const SizedBox(width: 40),
                  const Text('Status : ปกติ'),
                ],
              ),
              const SizedBox(height: 20),
              const Text('หมายเหตุ', style: TextStyle(fontSize: 20)),
              const SizedBox(
                height: 500,
                child: DetailInfo(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
