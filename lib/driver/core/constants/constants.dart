abstract class PhotoType {}

class UserPhotoType extends PhotoType{
  final int photoTypeUserCode;
  final String description;
  final String path;

  UserPhotoType({
    required this.path,
    required this.photoTypeUserCode, 
    required this.description
  });

}

class DrivePhotoType extends PhotoType{
  final int photoTypeDriveCode;
  final String description;
  final String path;

  DrivePhotoType( {
    required this.path,
    required this.photoTypeDriveCode, 
    required this.description
  });

}

List<UserPhotoType> userPhotoTypes = [

  UserPhotoType(
    photoTypeUserCode: 1,
    description: "Foto de perfil",
    path: "sudo-app/users"
  ),

  UserPhotoType(
    photoTypeUserCode: 2,
    description: "Foto del documento",
    path: "sudo-app/users"
  ),

  UserPhotoType(
    photoTypeUserCode: 3,
    description: "Foto de la licencia de conducir",
    path: "sudo-app/users"
  )

];

List<DrivePhotoType> drivePhotoTypes = [
  DrivePhotoType(
    photoTypeDriveCode: 1,
    description: "Foto del vehiculo",
    path: "sudo-app/drivers",
  ),
  DrivePhotoType(
    photoTypeDriveCode: 2,
    description: "Foto de la tarjeta de propiedad",
    path: "sudo-app/drivers",
  ),
];