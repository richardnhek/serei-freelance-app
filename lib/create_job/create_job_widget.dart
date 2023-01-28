import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_place_picker.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/place.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateJobWidget extends StatefulWidget {
  const CreateJobWidget({Key? key}) : super(key: key);

  @override
  _CreateJobWidgetState createState() => _CreateJobWidgetState();
}

class _CreateJobWidgetState extends State<CreateJobWidget> {
  String? experienceLevelValue;
  TextEditingController? preferredSkillsController;
  TextEditingController? requirementsController;
  TextEditingController? shortDescriptionController;
  TextEditingController? textController1;
  double? salaryRangeValue;
  var placePickerValue = FFPlace();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    preferredSkillsController = TextEditingController();
    requirementsController = TextEditingController();
    shortDescriptionController = TextEditingController();
    textController1 = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    preferredSkillsController?.dispose();
    requirementsController?.dispose();
    shortDescriptionController?.dispose();
    textController1?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 44, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'vsvsw06k' /* Create Job Post */,
                          ),
                          style: FlutterFlowTheme.of(context).title3,
                        ),
                        Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: FlutterFlowTheme.of(context).lineColor,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30,
                            buttonSize: 46,
                            icon: Icon(
                              Icons.close_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24,
                            ),
                            onPressed: () async {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 8, 20, 8),
                    child: StreamBuilder<List<CompaniesRecord>>(
                      stream: queryCompaniesRecord(
                        singleRecord: true,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: SpinKitFadingCube(
                                color: Color(0xFF5EFAF7),
                                size: 50,
                              ),
                            ),
                          );
                        }
                        List<CompaniesRecord> rowCompaniesRecordList =
                            snapshot.data!;
                        // Return an empty Container when the item does not exist.
                        if (snapshot.data!.isEmpty) {
                          return Container();
                        }
                        final rowCompaniesRecord =
                            rowCompaniesRecordList.isNotEmpty
                                ? rowCompaniesRecordList.first
                                : null;
                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: FlutterFlowTheme.of(context).lineColor,
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    valueOrDefault<String>(
                                      rowCompaniesRecord!.companyLogo,
                                      'https://images.saasworthy.com/flutterflow_13440_logo_1614062469_kgzxm.jpg',
                                    ),
                                    width: 60,
                                    height: 60,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    rowCompaniesRecord!.companyName!,
                                    style:
                                        FlutterFlowTheme.of(context).subtitle1,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 4, 0, 0),
                                    child: Text(
                                      rowCompaniesRecord!.companyCity!,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Divider(
                    height: 4,
                    thickness: 1,
                    color: FlutterFlowTheme.of(context).lineColor,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                          child: TextFormField(
                            controller: textController1,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: FFLocalizations.of(context).getText(
                                'el7aj0m8' /* Position Title */,
                              ),
                              labelStyle:
                                  FlutterFlowTheme.of(context).title3.override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .title3Family,
                                        color: FlutterFlowTheme.of(context)
                                            .grayIcon400,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .title3Family),
                                      ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).lineColor,
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).lineColor,
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context).title3.override(
                                  fontFamily:
                                      FlutterFlowTheme.of(context).title3Family,
                                  color: FlutterFlowTheme.of(context).darkText,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .title3Family),
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                          child: TextFormField(
                            controller: shortDescriptionController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: FFLocalizations.of(context).getText(
                                '0lm3ywzw' /* Short Description */,
                              ),
                              labelStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyText1Family,
                                    color: FlutterFlowTheme.of(context)
                                        .grayIcon400,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyText1Family),
                                  ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).lineColor,
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).lineColor,
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context).bodyText1,
                            textAlign: TextAlign.start,
                            maxLines: 3,
                            keyboardType: TextInputType.multiline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                          child: TextFormField(
                            controller: requirementsController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: FFLocalizations.of(context).getText(
                                '5thyfcs4' /* Requirements */,
                              ),
                              labelStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyText1Family,
                                    color: FlutterFlowTheme.of(context)
                                        .grayIcon400,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyText1Family),
                                  ),
                              hintText: FFLocalizations.of(context).getText(
                                '1ykjxzwx' /* Have to have x many years of e... */,
                              ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyText1Family,
                                    color: FlutterFlowTheme.of(context)
                                        .grayIcon400,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyText1Family),
                                  ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).lineColor,
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).lineColor,
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context).bodyText1,
                            textAlign: TextAlign.start,
                            maxLines: 3,
                            keyboardType: TextInputType.multiline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                          child: TextFormField(
                            controller: preferredSkillsController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: FFLocalizations.of(context).getText(
                                '2ujndzsf' /* Preferred Skills & Experiences */,
                              ),
                              labelStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyText1Family,
                                    color: FlutterFlowTheme.of(context)
                                        .grayIcon400,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyText1Family),
                                  ),
                              hintText: FFLocalizations.of(context).getText(
                                '3h2gb2st' /* Knowledge of software or proce... */,
                              ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyText1Family,
                                    color: FlutterFlowTheme.of(context)
                                        .grayIcon400,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyText1Family),
                                  ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).lineColor,
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).lineColor,
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context).bodyText1,
                            textAlign: TextAlign.start,
                            maxLines: 3,
                            keyboardType: TextInputType.multiline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.92,
                          height: 50,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            boxShadow: [
                              BoxShadow(
                                color: FlutterFlowTheme.of(context).lineColor,
                                offset: Offset(0, 1),
                              )
                            ],
                          ),
                          child: FlutterFlowDropDown<String>(
                            options: [
                              FFLocalizations.of(context).getText(
                                'fsn9op6q' /* < 6 Months */,
                              ),
                              FFLocalizations.of(context).getText(
                                'nx8rzsko' /* 6m - 1y */,
                              ),
                              FFLocalizations.of(context).getText(
                                'zr6qf3he' /* 1y - 3y */,
                              ),
                              FFLocalizations.of(context).getText(
                                'c25miaap' /* +3 years */,
                              ),
                              FFLocalizations.of(context).getText(
                                'pp6ssfqx' /* +5 years */,
                              ),
                              FFLocalizations.of(context).getText(
                                '07c2oxig' /* +8 years */,
                              )
                            ],
                            onChanged: (val) =>
                                setState(() => experienceLevelValue = val),
                            width: MediaQuery.of(context).size.width,
                            height: 40,
                            textStyle: FlutterFlowTheme.of(context).bodyText1,
                            hintText: FFLocalizations.of(context).getText(
                              'a8mn2mib' /* Experience Level */,
                            ),
                            icon: FaIcon(
                              FontAwesomeIcons.chevronDown,
                              color: FlutterFlowTheme.of(context).grayIcon400,
                              size: 16,
                            ),
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            elevation: 2,
                            borderColor: Colors.transparent,
                            borderWidth: 0,
                            borderRadius: 0,
                            margin:
                                EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
                            hidesUnderline: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            '215z38z9' /* Salary */,
                          ),
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 4),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'elefikgx' /* $40,000 */,
                          ),
                          style: FlutterFlowTheme.of(context).bodyText2,
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            'dm03wz8e' /* $150,000+ */,
                          ),
                          textAlign: TextAlign.end,
                          style: FlutterFlowTheme.of(context).bodyText2,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                    child: Slider(
                      activeColor: FlutterFlowTheme.of(context).secondaryColor,
                      inactiveColor: Color(0xFF9E9E9E),
                      min: 40000,
                      max: 160000,
                      value: salaryRangeValue ??= 100000,
                      label: salaryRangeValue.toString(),
                      divisions: 24,
                      onChanged: (newValue) {
                        setState(() => salaryRangeValue = newValue);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.92,
                          height: 50,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            boxShadow: [
                              BoxShadow(
                                color: FlutterFlowTheme.of(context).lineColor,
                                offset: Offset(0, 1),
                              )
                            ],
                          ),
                          child: FlutterFlowPlacePicker(
                            iOSGoogleMapsApiKey:
                                'AIzaSyAQEmE9Qqm41bxuC7EBO19_8BXtpie-7ck',
                            androidGoogleMapsApiKey:
                                'AIzaSyDvw9Cfn9exSQ1MTSdTckQ53tbWojl7JwU',
                            webGoogleMapsApiKey:
                                'AIzaSyAI7sDrh7-i-6quu5ctpPpoyiLRJO7-enk',
                            onSelect: (place) async {
                              setState(() => placePickerValue = place);
                            },
                            defaultText: FFLocalizations.of(context).getText(
                              '9ov6vdus' /* Location */,
                            ),
                            icon: Icon(
                              Icons.place,
                              color: FlutterFlowTheme.of(context).grayIcon400,
                              size: 16,
                            ),
                            buttonOptions: FFButtonOptions(
                              width: 200,
                              height: 40,
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .subtitle2Family,
                                    color: FlutterFlowTheme.of(context)
                                        .grayIcon400,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .subtitle2Family),
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0, 1),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration: BoxDecoration(
                color: Color(0xFF8EFFC1),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3,
                    color: Color(0x33000000),
                    offset: Offset(0, -1),
                  )
                ],
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 36),
                child: FFButtonWidget(
                  onPressed: () async {
                    final jobPostsCreateData = createJobPostsRecordData(
                      jobName: textController1!.text,
                      jobDescription: shortDescriptionController!.text,
                      jobCompany: '',
                      salary: salaryRangeValue?.toString(),
                      timeCreated: getCurrentTimestamp,
                      jobLocation: placePickerValue.latLng,
                      postedBy: currentUserReference,
                      jobRequirements: requirementsController!.text,
                      jobPreferredSkills: experienceLevelValue,
                      myJob: true,
                    );
                    await JobPostsRecord.collection
                        .doc()
                        .set(jobPostsCreateData);
                    Navigator.pop(context);
                  },
                  text: FFLocalizations.of(context).getText(
                    'xbzasjoz' /* Create Post */,
                  ),
                  options: FFButtonOptions(
                    width: 130,
                    height: 40,
                    color: Color(0xFF8EFFC1),
                    textStyle: FlutterFlowTheme.of(context).subtitle1.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).subtitle1Family,
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).subtitle1Family),
                        ),
                    elevation: 0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
