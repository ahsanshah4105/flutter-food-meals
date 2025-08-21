import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/core/extensions/opacity_extension.dart';
import 'package:food/core/screen_size/size_config.dart';
import 'package:get/get.dart';
import '../utils/app_colors.dart';

class ImageViewer extends StatelessWidget {
  final String url;
  final double? height ;
  final double? width;
  final double? scale;
  final double borderRadius;
  final Color? color;
  final BoxFit? fit;
  final Function ?onImageLoaded;
  final VoidCallback? onTap;

  const ImageViewer({
    Key? key,
    required this.url,
    this.height,
    this.width,
    this.scale,
    this.borderRadius = 0.0,
    this.color,
    this.onImageLoaded,
    this.fit,
    this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;

    if (url.endsWith('.svg') && (url.startsWith('http') || url.startsWith('https'))) {
      imageWidget = SvgPicture.network(
        url,
        height: height,
        width: width,
        fit: fit ?? BoxFit.contain,
        colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
        placeholderBuilder: (context) => SizedBox(
          height: height,
          width: width,
          child: const Center(child: CircularProgressIndicator()),
        ),
      );
    } else if (url.endsWith('.svg')) {
      imageWidget = SvgPicture.asset(
        url,
        height: height,
        width: width,
        fit: fit ?? BoxFit.contain,
        colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
      );
    } else if (url.startsWith('http') || url.startsWith('https')) {
      imageWidget = CachedNetworkImage(
        imageUrl: url,
        height: height,
        width: width,
        fit: fit ?? BoxFit.cover,
        color: color,
        placeholder: (context, url) => SizedBox(
          height: height,
          width: width,
          child: const Center(child: CupertinoActivityIndicator()),
        ),
        errorWidget: (context, url, error) => SizedBox(
          height: height,
          width: width,
          child: Icon(Icons.info_outline, color: AppColors.error),
        ),
        imageBuilder: (context, imageProvider) {
          // Image has fully loaded

          if(onImageLoaded !=null){
            onImageLoaded!();
          }


          return Image(
            image: imageProvider,
            height: height,
            width: width,
            fit: fit ?? BoxFit.cover,
            color: color,
          );
        },
      );
    } else {
      imageWidget = Image.asset(
        url,
        height: height,
        width: width,
        scale: scale ?? 1.0,
        fit: fit ?? BoxFit.cover,
        color: color,
        errorBuilder: (context, error, stackTrace) {
          return Container(
              height: height,
              width: width,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.r),color: AppColors.primary.setOpacity(0.1)),
              child: Icon(Icons.info_outline,color: AppColors.error,));
        },
      );
    }
    Widget clippedImage = ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: imageWidget,
    );

    return onTap != null
        ? GestureDetector(
      onTap: onTap,
      child: clippedImage,
    )
        : clippedImage;
  }
}
