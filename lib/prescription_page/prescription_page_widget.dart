import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrescriptionPageWidget extends StatefulWidget {
  PrescriptionPageWidget({Key key}) : super(key: key);

  @override
  _PrescriptionPageWidgetState createState() => _PrescriptionPageWidgetState();
}

class _PrescriptionPageWidgetState extends State<PrescriptionPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.customColor1,
    );
  }
}
