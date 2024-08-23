import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../common/app_colors.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundPrimary,
        centerTitle: false,
        title: const Text(
          'Home screen',
          style: TextStyle(color: AppColors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('Set valid API Base URL in order to continue'),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.compare_arrows_sharp),
                const SizedBox(
                  width: 30,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextFormField(),
                ),
              ],
            ),
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
                    'Start counting process',
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
