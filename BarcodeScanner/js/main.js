const readerId = "reader";
async function initScanner() {
    let controlAddin = document.getElementById("controlAddIn");
    controlAddin.style.overflow = 'auto';
    var outerDiv = document.createElement("div");
    outerDiv.id = readerId;
    controlAddin.appendChild(outerDiv);
    // let html5QrcodeScanner = new Html5QrcodeScanner(
    //     "reader",
    //     { fps: 10, qrbox: { width: 250, height: 250 } },
    //   /* verbose= */ false);
    // html5QrcodeScanner.render(onScanSuccess, onScanFailure);
    const html5QrCode = new Html5Qrcode("reader");
    const qrCodeSuccessCallback = (decodedText, decodedResult) => {
        /* handle success */
        Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('onScanSuccess', [decodedText]);
    };
    const config = { fps: 10, qrbox: { width: 250, height: 250 } };
    html5QrCode.start(
        { facingMode: "environment" },
        config,
        qrCodeSuccessCallback)
    .catch((err) => {
        // Start failed, handle it.        
        let controlAddin = document.getElementById("controlAddIn");
        var outerDiv = document.createElement("div");
        outerDiv.innerHTML = '<span>Missing Permission for camera</span>'
        controlAddin.appendChild(outerDiv);
    });
}


function onScanSuccess(decodedText, decodedResult) {
    // handle the scanned code as you like, for example:
    console.log(`Code matched = ${decodedText}`, decodedResult);

    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('onScanSuccess', [decodedText]);
}

function onScanFailure(error) {
    // handle scan failure, usually better to ignore and keep scanning.
    // for example:
    console.warn(`Code scan error = ${error}`);
}