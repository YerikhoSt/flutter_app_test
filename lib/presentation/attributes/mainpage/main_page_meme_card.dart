import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test/model/meme_model.dart';
import 'package:flutter_app_test/utils/config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainPageMemeCard extends StatefulWidget {
  final MemeModel meme;
  final void Function() onTap;
  const MainPageMemeCard({
    super.key,
    required this.meme,
    required this.onTap,
  });

  @override
  State<MainPageMemeCard> createState() => _MainPageMemeCardState();
}

class _MainPageMemeCardState extends State<MainPageMemeCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(10.w),
        margin: EdgeInsets.only(bottom: 15.h),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Theme.of(context).indicatorColor.withOpacity(0.2),
              blurRadius: 4,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: widget.meme.url,
              imageBuilder: (_, ImageProvider imageProvider) => Container(
                margin: const EdgeInsets.only(bottom: 5),
                height: 200.w,
                width: 200.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (_, __) => Container(
                height: 200,
                color: Colors.black12,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              errorWidget: (_, __, ___) => Image.asset(
                'assets/img/danger.png',
                width: 200.w,
                height: 200.w,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              widget.meme.name,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 18.sp,
                    fontWeight: Config.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
