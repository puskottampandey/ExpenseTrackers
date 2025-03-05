abstract class CommonEnumData {
  String get en;
  String get ne;
  String get value;
}

enum ErrorMessage { TOKEN_EXPIRED }

enum UserRole implements CommonEnumData {
  SUDO_ADMIN(
    en: "Sudo Admin",
    ne: "सुडो प्रशासक",
    value: "SUDO_ADMIN",
  ),
  ADMIN(
    en: "Admin",
    ne: "प्रशासक",
    value: "ADMIN",
  ),
  COMPANY_SUPER_ADMIN(
    en: "Company Super Admin",
    ne: "कम्पनी सुपर प्रशासक",
    value: "COMPANY_SUPER_ADMIN",
  ),
  COMPANY_ADMIN(
    en: "Company Admin",
    ne: "कम्पनी प्रशासक",
    value: "COMPANY_ADMIN",
  ),
  COMPANY_EMPLOYEE(
    en: "Company Employee",
    ne: "कम्पनी कर्मचारी",
    value: "COMPANY_EMPLOYEE",
  ),
  USER(
    en: "User",
    ne: "प्रयोगकर्ता",
    value: "USER",
  );

  @override
  final String en;
  @override
  final String ne;
  @override
  final String value;

  const UserRole({
    required this.en,
    required this.ne,
    required this.value,
  });
}

enum FileUploadType {
  LEAD_UPLOAD,
  EMPLOYEE_PHOTO,
  TEST,
  LEAVE_REQUEST,
  WORK_LOG,
  COMPANY_FEEDBACK_AND_COMPLAIN,
  TASK_PLANNER,
}
