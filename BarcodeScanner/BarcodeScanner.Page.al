page 99100 "PRI-GKM Barcode Scanner"
{
    Caption = 'Barcode Scanner';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {

            usercontrol("Barcode Scanner"; "PRI-GKM Barcode Scanner")
            {
                ApplicationArea = All;

                trigger ControlAddInReady()
                begin
                    ControlLoaded := true;
                    InitScanner();
                end;

                trigger onScanSuccess(scannedValue: Text)
                begin
                    Message(scannedValue);
                    CurrPage.Close();
                end;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }
    var
        ControlLoaded: Boolean;

    local procedure InitScanner()
    begin
        if ControlLoaded then begin
            CurrPage."Barcode Scanner".initScanner();
        end;
    end;
}