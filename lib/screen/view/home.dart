import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../controller/home_controller.dart';
import '../../widgets/home_category.dart';
import '../../widgets/home_items.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
                children: [
                  // HomePickUp(),
                  HomeCategory(),
                  HomeItems(),
                ],
              ),
    );
  }
}
