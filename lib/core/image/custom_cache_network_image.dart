import 'package:cached_network_image/cached_network_image.dart';
import 'package:expensetracker/core/config/env.dart';
import 'package:expensetracker/core/constants/costant_assets.dart';
import 'package:expensetracker/core/image/cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    required this.url,
    required this.fit,
    this.height,
    this.width,
    this.color,
    this.placeholder,
    this.placeholderFit,
    this.alignment = Alignment.center,
    this.customPlaceHolder,
  });

  final String url;
  final BoxFit fit;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit? placeholderFit;
  final String? placeholder;
  final Alignment alignment;
  final Widget? customPlaceHolder;

  @override
  Widget build(BuildContext context) {
    final key = RepositoryProvider.of<Env>(context).apiKey;
    return CachedNetworkImage(
      imageUrl: url,
      fit: fit,
      height: height,
      width: width,
      color: color,
      httpHeaders: {
        "x-api-key": key,
      },
      alignment: alignment,
      cacheManager: CustomCacheManager.instance,
      errorWidget: (a, b, c) =>
          customPlaceHolder ??
          Image.asset(
            placeholder ?? Assets.placeholder,
            fit: placeholderFit ?? fit,
            height: height,
            alignment: alignment,
            width: width,
          ),
      placeholder: (a, c) =>
          customPlaceHolder ??
          Image.asset(
            placeholder ?? Assets.placeholder,
            fit: placeholderFit ?? fit,
            height: height,
            alignment: alignment,
            width: width,
          ),
    );
  }
}
