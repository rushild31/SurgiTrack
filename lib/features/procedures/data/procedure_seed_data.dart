import 'package:surgitrack/features/procedures/domain/procedure.dart';

class ProcedureSeedData {
  static final List<ProcedureEntity> procedures = [
    // =========================
    // CARDIAC - CORONARY
    // =========================
    ProcedureEntity(
      procedureId: "CABG",
      name: "Coronary Artery Bypass Grafting (CABG)",
      specialty: "Cardiac",
      category: "Coronary",
      aliases: ["CABG", "Bypass Surgery"],
      description:
          "Surgical myocardial revascularization using arterial and/or venous grafts.",
      createdAt: DateTime(2026),
    ),

    ProcedureEntity(
      procedureId: "OPCAB",
      name: "Off Pump Coronary Artery Bypass (OPCAB)",
      specialty: "Cardiac",
      category: "Coronary",
      aliases: ["OPCAB", "Beating Heart CABG"],
      description:
          "Coronary bypass surgery performed without cardiopulmonary bypass.",
      createdAt: DateTime(2026),
    ),

    // =========================
    // VALVE
    // =========================
    ProcedureEntity(
      procedureId: "AVR",
      name: "Aortic Valve Replacement",
      specialty: "Cardiac",
      category: "Valve",
      aliases: ["AVR"],
      createdAt: DateTime(2026),
    ),

    ProcedureEntity(
      procedureId: "MVR",
      name: "Mitral Valve Replacement",
      specialty: "Cardiac",
      category: "Valve",
      aliases: ["MVR"],
      createdAt: DateTime(2026),
    ),

    ProcedureEntity(
      procedureId: "MV_REPAIR",
      name: "Mitral Valve Repair",
      specialty: "Cardiac",
      category: "Valve",
      aliases: ["MV Repair"],
      createdAt: DateTime(2026),
    ),

    ProcedureEntity(
      procedureId: "DVR",
      name: "Double Valve Replacement",
      specialty: "Cardiac",
      category: "Valve",
      aliases: ["DVR"],
      createdAt: DateTime(2026),
    ),

    // =========================
    // AORTIC
    // =========================
    ProcedureEntity(
      procedureId: "BENTALL",
      name: "Bentall Procedure",
      specialty: "Cardiac",
      category: "Aorta",
      aliases: ["Composite Root Replacement"],
      createdAt: DateTime(2026),
    ),

    ProcedureEntity(
      procedureId: "ASC_AORTA",
      name: "Ascending Aorta Replacement",
      specialty: "Cardiac",
      category: "Aorta",
      aliases: ["Ascending Aortic Replacement"],
      createdAt: DateTime(2026),
    ),

    // =========================
    // CONGENITAL
    // =========================
    ProcedureEntity(
      procedureId: "ASD_CLOSE",
      name: "ASD Closure",
      specialty: "Cardiac",
      category: "Congenital",
      aliases: ["Atrial Septal Defect Closure"],
      createdAt: DateTime(2026),
    ),

    // =========================
    // THORACIC
    // =========================
    ProcedureEntity(
      procedureId: "LOBECTOMY",
      name: "Pulmonary Lobectomy",
      specialty: "Thoracic",
      category: "Lung",
      aliases: ["Lobectomy"],
      createdAt: DateTime(2026),
    ),

    ProcedureEntity(
      procedureId: "DECORTICATION",
      name: "Pleural Decortication",
      specialty: "Thoracic",
      category: "Pleura",
      aliases: ["Decortication"],
      createdAt: DateTime(2026),
    ),

    // =========================
    // VASCULAR
    // =========================
    ProcedureEntity(
      procedureId: "AV_FISTULA",
      name: "AV Fistula Creation",
      specialty: "Vascular",
      category: "Dialysis Access",
      aliases: ["AVF"],
      createdAt: DateTime(2026),
    ),
  ];
}
