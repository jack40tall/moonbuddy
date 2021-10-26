import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

const ColorizeColors = [
  Colors.purple,
  Colors.blue,
  Colors.yellow,
  Colors.red,
];

const ColorizeTextStyle = TextStyle(
  fontSize: 60.0,
  fontFamily: 'Horizon',
);

const TextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

final ButtonStyle accountSummaryStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.black87,
  primary: Colors.grey[300],
  minimumSize: Size(88, 36),
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2)),
  ),
);

HexColor kPrimaryPinkDark = HexColor('eb9fef');
HexColor kSecondaryPinkDark = HexColor('fecee9');
HexColor kThirdGrayDark = HexColor('545677');
HexColor kFourthBlueDark = HexColor("03254E");
HexColor kFifthBlueDark = HexColor("011C27");
HexColor kBackgroundDark = HexColor("252323");

HexColor kButtonGreen = HexColor("0a5516");
HexColor kCreatorGrey = HexColor("627075");

const kTextColor = Color(0xFF151C2A);
const kTextSecondaryColor = Color(0xFF7E8EAA);
const kShadowColor3 = Color.fromRGBO(0, 0, 0, 0.10);
const kShadowColor5 = Color.fromRGBO(238, 226, 255, 0.70);

const kSpacingUnit = 10.0;

final kTitleTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(16),
  color: kTextColor,
);

final kBodyTextStyle = GoogleFonts.lato(fontSize: 30);

final kCaptionTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(10),
  color: kTextSecondaryColor,
);

final kCardTextStyle = TextStyle(
  fontFamily: 'TTNorms',
  color: Colors.white,
  shadows: [
    BoxShadow(
      color: kShadowColor3,
      blurRadius: kSpacingUnit.w,
      offset: Offset(0, kSpacingUnit.w * 0.5),
    ),
  ],
);
