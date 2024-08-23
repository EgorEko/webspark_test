import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../common/app_colors.dart';

@RoutePage()
class ProcessScreen extends StatefulWidget {
  const ProcessScreen({super.key});

  @override
  State<ProcessScreen> createState() => _ProcessScreenState();
}

class _ProcessScreenState extends State<ProcessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundPrimary,
        centerTitle: false,
        title: const Text(
          'Process screen',
          style: TextStyle(color: AppColors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'All calculations has finished, you can send your results to server',
            ),
            const Divider(),
            const Spacer(),
            Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width * 0.9,
                ),
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    backgroundColor: AppColors.backgroundPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    side: const BorderSide(
                      width: 2,
                      color: AppColors.cornerColor,
                    ),
                  ),
                  child: const Text(
                    'Send results to server',
                    style: TextStyle(color: AppColors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
