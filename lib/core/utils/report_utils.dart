// import 'package:go_router/go_router.dart';
// import 'package:starter/core/constants/common_enum.dart';
// import 'package:starter/core/route/route.dart';
// import 'package:starter/core/theme/theme_import.dart';

// import 'package:starter/feature/leave_request/presentation/screen/cold_call_screen.dart';
// import 'package:starter/feature/report/domain/entity/report_status.dart';

// class ReportUtils {
//   static dynamic getParam(
//     ReportType reportType,
//     Period period,
//   ) {
//     if (reportType == ReportType.coldCall) {
//       return ColdCallParam(
//         leadId: "",
//         period: period,
//       );
//     } else if (reportType == ReportType.followUp) {
//       return FollowUpScreenParam(period: period);
//     } else if (reportType == ReportType.potentialLead) {
//       return period;
//     } else if (reportType == ReportType.demo) {
//       return DemoScreenParam(
//         potentialLeadId: "",
//         period: period,
//       );
//     } else if (reportType == ReportType.training) {
//       return TrainingScreenParam(potentialLeadId: "", period: period);
//     } else if (reportType == ReportType.leadConversion) {
//       return ColdCallParam(
//         leadId: "",
//         period: period,
//         endPoint: "reports/lead-conversion-by-date-range",
//         title: "Lead Conversion Report",
//       );
//     }
//   }

//   static String getRoute(ReportType reportType) {
//     if (reportType == ReportType.coldCall) {
//       return Routes.coldCallReportScreen;
//     } else if (reportType == ReportType.followUp) {
//       return Routes.followUpReportScreen;
//     } else if (reportType == ReportType.potentialLead) {
//       return Routes.potentialLeadReportScreen;
//     } else if (reportType == ReportType.demo) {
//       return Routes.demoReportScreen;
//     } else if (reportType == ReportType.training) {
//       return Routes.trainingReportScreen;
//     } else if (reportType == ReportType.leadConversion) {
//       return Routes.leadConversionReportScreen;
//     } else {
//       return "";
//     }
//   }

//   static List<String> getEndPointForReportStatus(ReportType reportType) {
//     if (reportType == ReportType.coldCall) {
//       return ["cold-call-status", "cold-call-response-status"];
//     } else if (reportType == ReportType.followUp) {
//       return ["follow-up-status"];
//     } else if (reportType == ReportType.potentialLead) {
//       return ['potential-lead-status'];
//     } else if (reportType == ReportType.demo) {
//       return ['demo-status'];
//     } else {
//       return [];
//     }
//   }

//   static reportNavigate(
//       Period period, ReportType reportType, BuildContext context) {
//     context.push(
//       getRoute(reportType),
//       extra: getParam(reportType, period),
//     );
//   }
// }
