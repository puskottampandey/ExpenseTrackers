import 'package:expensetracker/core/config/env.dart';
import 'package:expensetracker/core/constants/costant_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomNetWorkImage extends StatelessWidget {
  final BoxFit? fit;
  final String url;
  final double? height;
  final double? width;
  final String? placeholder;
  final Alignment alignment;
  final BoxFit? placeholderFit;

  final double borderRadius;
  const CustomNetWorkImage({
    super.key,
    required this.url,
    this.fit,
    this.height,
    this.width,
    this.placeholder,
    this.borderRadius = 0,
    this.placeholderFit,
    this.alignment = Alignment.center,
  });

  @override
  Widget build(BuildContext context) {
    final key = RepositoryProvider.of<Env>(context).apiKey;

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Image(
        height: height,
        width: width,

        // key: UniqueKey(),
        image: NetworkImage(
          url,
          headers: {
            "x-api-key": key,
          },
        ),
        fit: fit ?? BoxFit.contain,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          } else {
            return Image.asset(
              placeholder ?? Assets.placeholder,
              fit: placeholderFit ?? fit,
              height: height,
              alignment: alignment,
              width: width,
            );
          }
        },
        errorBuilder: (context, error, stackTrace) {
          return Image.asset(
            placeholder ?? Assets.placeholder,
            fit: placeholderFit ?? fit,
            height: height,
            alignment: alignment,
            width: width,
          );
        },
      ),
    );
  }
}
