# TRZz

This app depends on code generation libraries (Json code generation and MobX)

In order to build, you must execute the following command in you VS Code Terminal:

	flutter packages pub run build_runner watch --delete-conflicting-outputs
  
The app follows the MVVM pattern, being organized accordingly:
  Core (project setup for depency injection / service locator, network, error handling and theming)
  Models
  Services
  UI
    View
    ViewModel
