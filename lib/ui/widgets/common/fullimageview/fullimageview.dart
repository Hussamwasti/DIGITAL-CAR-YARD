import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'fullimageview_model.dart';

class FullImageView extends StackedView<FullimageviewModel> {
  final String imageUrl;

  const FullImageView({super.key, required this.imageUrl});

  @override
  Widget builder(
    BuildContext context,
    FullimageviewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Center(
          child: Hero(
            tag: imageUrl,
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.contain,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
      ),
    );
  }

  @override
  FullimageviewModel viewModelBuilder(
    BuildContext context,
  ) =>
      FullimageviewModel();
}
