// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:create_app/components/toolbar.dart';
import 'package:create_app/config/app_icons.dart';
import 'package:create_app/config/app_strings.dart';
import 'package:create_app/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:latlong2/latlong.dart';

class NearbyPage extends StatelessWidget {
  const NearbyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Toolbar(title: AppStrings.nearby),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(24.7577, 92.7923),
          zoom: 10,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'dev.ces.flutter',
            // Plenty of other options available!
          ),
          MarkerLayer(
            markers: [
              Marker(
                width: 100,
                height: 60,
                point: LatLng(24.7577, 92.7923),
                child: Builder(
                  builder: (context) {
                    return Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                          ),
                          child: Text(
                            AppStrings.username,
                            style: TextStyle(color: AppColors.black),
                          ),
                        ),
                        SvgPicture.asset(
                          AppIcons.location,
                          colorFilter: ColorFilter.mode(
                              AppColors.black, BlendMode.srcIn),
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
