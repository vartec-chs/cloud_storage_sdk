import 'cloud_storage_api.dart';
import 'adapters/dropbox_adapter.dart';
import 'adapters/google_drive_adapter.dart';
import 'adapters/onedrive_adapter.dart';
import 'adapters/yandex_drive_adapter.dart';

import 'package:dropbox_api/dropbox_api.dart' as dropbox;
import 'package:google_drive_api/google_drive_api.dart' as gdrive;
import 'package:onedrive_api/onedrive_rest_api.dart' as onedrive;
import 'package:yandex_drive_api/yandex_drive_api.dart' as yandex;

enum CloudProvider { dropbox, googleDrive, oneDrive, yandexDisk }

class CloudStorage {
  final CloudProvider provider;
  final CloudStorageApi api;

  const CloudStorage._(this.provider, this.api);

  factory CloudStorage.dropbox(dropbox.DropboxApi api) =>
      CloudStorage._(CloudProvider.dropbox, DropboxAdapter(api));

  factory CloudStorage.googleDrive(gdrive.GoogleDriveApi api) =>
      CloudStorage._(CloudProvider.googleDrive, GoogleDriveAdapter(api));

  factory CloudStorage.oneDrive(onedrive.OneDriveApi api) =>
      CloudStorage._(CloudProvider.oneDrive, OneDriveAdapter(api));

  factory CloudStorage.yandexDisk(yandex.YandexDriveApi api) =>
      CloudStorage._(CloudProvider.yandexDisk, YandexDriveAdapter(api));
}
