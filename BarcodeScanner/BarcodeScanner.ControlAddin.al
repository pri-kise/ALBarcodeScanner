controladdin "PRI-GKM Barcode Scanner"
{
    RequestedHeight = 300;
    MinimumHeight = 300;
    // MaximumHeight = 300;
    // RequestedWidth = 700;
    // MinimumWidth = 700;
    // MaximumWidth = 700;
    VerticalStretch = true;
    VerticalShrink = true;
    HorizontalStretch = true;
    HorizontalShrink = true;
    Scripts = './BarcodeScanner/js/main.js', 'https://unpkg.com/html5-qrcode';
    StartupScript = './BarcodeScanner/js/startup.js';
    // RecreateScript = 'recreateScript.js';
    // RefreshScript = 'refreshScript.js';

    event ControlAddInReady();

    event onScanSuccess(scannedValue: Text)

    procedure initScanner()
}