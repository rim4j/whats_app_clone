import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:whats_app_clone/common/constants/asset_images.dart';
import 'package:whats_app_clone/config/theme/app_colors.dart';

Widget profileWidget({String? imageUrl, File? image}) {
  if (image == null) {
    if (imageUrl == null || imageUrl == "") {
      return Image.asset(
        AssetImages.profileDefault,
        fit: BoxFit.cover,
      );
    } else {
      return CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        progressIndicatorBuilder: (context, url, downloadProgress) {
          return const CircularProgressIndicator(
            color: AppColorsDark.primary,
          );
        },
        errorWidget: (context, url, error) => Image.asset(
          AssetImages.profileDefault,
          fit: BoxFit.cover,
        ),
      );
    }
  } else {
    return Image.file(
      image,
      fit: BoxFit.cover,
    );
  }
}
