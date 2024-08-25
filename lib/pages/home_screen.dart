import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/data_exchange_bloc/data_exchange_bloc.dart';
import '../common/app_colors.dart';
import '../router/app_router.gr.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController pathController;

  @override
  void initState() {
    pathController =
        TextEditingController(text: 'https://flutter.webspark.dev');
    super.initState();
  }

  @override
  void dispose() {
    pathController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Home screen',
          style: TextStyle(color: AppColors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 30),
        child: BlocConsumer<DataExchangeBloc, DataExchangeState>(
          listener: (context, state) {
            if (state is DataExchangeSucceed) {
              context.router.push(ProcessRoute(vertexes: state.vertexes));
            }
          },
          builder: (context, state) {
            return Column(
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
                      child: TextFormField(
                        controller: pathController,
                        decoration: InputDecoration(
                          errorText: _validate(pathController.text),
                        ),

                      ),
                    ),
                  ],
                ),
                if (state is DataExchangeFailed)
                  Center(
                    child: Text(state.error),
                  ),
                if (state is DataExchangeLoading)
                  const CircularProgressIndicator(),
                const Spacer(),
                Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: MediaQuery.of(context).size.width * 0.9,
                    ),
                    child: OutlinedButton(
                      onPressed: () {
                        context
                            .read<DataExchangeBloc>()
                            .loadData(pathController.text);
                      },
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
            );
          },
        ),
      ),
    );
  }

  _validate(String value){
      if (!value.contains('https://') || value.isEmpty) {
        return 'Please, enter valid path';
      }
      return null;
    }
}
