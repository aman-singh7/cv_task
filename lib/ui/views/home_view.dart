import 'package:cv_task/ui/views/base_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
      builder: (context, model, child) {
        return const Scaffold(
          body: Center(
            child: Text('Home View'),
          ),
        );
      },
    );
  }
}
