import 'package:flutter/material.dart';

final highElevation = <BoxShadow>[
  BoxShadow(
    color: const Color(0xff0D3F67).withOpacity(0.10),
    offset: const Offset(0, 16),
    blurRadius: 40,
    spreadRadius: 0,
  )
];
final lowElevation = <BoxShadow>[
  BoxShadow(
    color: const Color(0xff0D3F67).withOpacity(0.08),
    offset: const Offset(6, 12),
    blurRadius: 15,
    spreadRadius: 0,
  )
];
final highElevationTwo = <BoxShadow>[
  BoxShadow(
    color: const Color(0xff0D3F67).withOpacity(0.10),
    offset: const Offset(0, -16),
    blurRadius: 40,
    spreadRadius: 0,
  )
];
final lowElevationTwo = <BoxShadow>[
  BoxShadow(
    color: const Color(0xff0D3F67).withOpacity(0.08),
    offset: const Offset(6, -12),
    blurRadius: 15,
    spreadRadius: 0,
  )
];

const double radiusLarge = 36;
const double radiusMedium = 18;
const double radiusSmall = 10;
