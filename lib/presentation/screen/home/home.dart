import 'package:flutter/material.dart';
import 'package:training/presentation/common/base_screen_view/base_screen_view.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreenView(title: '',body: _buildBody(),);
  }
}

extension HomeView on Home {
  _buildBody() {
    return Column(
      children: [
        Row(
          
        )
      ],
    );
  }
}