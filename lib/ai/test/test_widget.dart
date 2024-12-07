import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'test_model.dart';
export 'test_model.dart';

class TestWidget extends StatefulWidget {
  const TestWidget({super.key});

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  late TestModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'Page Title',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Inter Tight',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                child: SizedBox(
                  width: 370.0,
                  height: 230.0,
                  child: FlutterFlowLineChart(
                    data: [
                      FFLineChartData(
                        xData: List.generate(random_data.randomInteger(5, 5),
                            (index) => random_data.randomInteger(0, 10)),
                        yData: List.generate(random_data.randomInteger(5, 5),
                            (index) => random_data.randomInteger(0, 10)),
                        settings: LineChartBarData(
                          color: FlutterFlowTheme.of(context).primary,
                          barWidth: 5.0,
                          isCurved: true,
                          dotData: const FlDotData(show: false),
                          belowBarData: BarAreaData(
                            show: true,
                            color: const Color(0x2A3675FF),
                          ),
                        ),
                      )
                    ],
                    chartStylingInfo: const ChartStylingInfo(
                      backgroundColor: Color(0x00FFFFFF),
                      showBorder: false,
                    ),
                    axisBounds: const AxisBounds(),
                    xAxisLabelInfo: const AxisLabelInfo(
                      title: 'Days',
                      titleTextStyle: TextStyle(
                        fontSize: 14.0,
                      ),
                      reservedSize: 32.0,
                    ),
                    yAxisLabelInfo: const AxisLabelInfo(
                      reservedSize: 40.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
