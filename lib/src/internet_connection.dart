
/*
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class InternetConnectivityScreen extends StatelessWidget {
  const InternetConnectivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Connectivity connectivity = Connectivity();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Internet Connectivity'),
        centerTitle: true,
      ),
      body: StreamBuilder<ConnectivityResult>(
          stream: connectivity.onConnectivityChanged,
          builder: (_, snapshot) {
            return IntertnetConnectionWidget(
              snapshot: snapshot,
              widget: const Text('Connected'),
            );
          }),
    );
  }
}

class IntertnetConnectionWidget extends StatelessWidget {
  final AsyncSnapshot<ConnectivityResult> snapshot;
  final Widget widget;
  const IntertnetConnectionWidget(
      {super.key, required this.snapshot, required this.widget});

  @override
  Widget build(BuildContext context) {
    switch (snapshot.connectionState) {
      case ConnectionState.active:
        final state = snapshot.data!;
        switch (state) {
          case ConnectivityResult.none:
            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.wifi_off_rounded),
                SizedBox(
                  height: 5,
                ),
                Center(child: Text('No internet connection'))
              ],
            );
          default:
            return widget;
        }

      default:
        return const Text('');
    }
  }
}
*/