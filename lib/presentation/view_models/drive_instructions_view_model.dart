class DriveInstructionsViewModel {
  final int driveToKm;
  final String instruction;

  DriveInstructionsViewModel(
      {required this.driveToKm, required this.instruction});
}

final driveInstructionMocked = DriveInstructionsViewModel(
  driveToKm: 15,
  instruction: 'Drive the road straight for 15km',
);
