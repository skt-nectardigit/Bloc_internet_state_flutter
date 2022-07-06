import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_flutter/cubit/internet_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocConsumer<InternetCubit, InternetState>(builder: (BuildContext context, state) {
            if (state==InternetState.connected) {
              return const Text("Connected");
            }
            else{
              return const Text("Disconnected");
            }
          },
            listener: (BuildContext context, Object? state) {
            if (state==InternetState.connected) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Connected"), backgroundColor: Colors.green,));
            }
            else{
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Disconnected"), backgroundColor: Colors.red,));
            }
            },),
        ),
      ),
    );
  }
}