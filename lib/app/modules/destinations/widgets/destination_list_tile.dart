import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:my_trip/app/global_widgets/default_text.dart';
import '../../../core/theme/color_theme.dart';

class DestinationListTile extends StatelessWidget {
  const DestinationListTile(
      {Key? key,
      required this.height,
      required this.width,
      required this.image,
      required this.text,
      required this.ontap,
      required this.address})
      : super(key: key);

  final double height;
  final double width;
  final String text;
  final String image;
  final Function ontap;
  final String address;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ontap(),
      child: SizedBox(
        height: height * 0.2,
        child: Row(
          children: [
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage(
                        'https://mytrip.justhost.ly/$image',
                      ),
                      fit: BoxFit.cover,
                      isAntiAlias: true)),
            )),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DefaultText(
                      text,
                      color: Colors.black,
                      fontSize: width * 0.045,
                      fontWeight: FontWeight.w800,
                    ),
                    SizedBox(height: width * 0.02),
                    RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(
                              PhosphorIcons.map_pin,
                              size: width * 0.04,
                              color: AppThemeColors.grayPrimary300,
                            ),
                          ),
                          WidgetSpan(
                            child: DefaultText(
                              address,
                              height: 1,
                              color: AppThemeColors.grayPrimary400,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: width * 0.04),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
