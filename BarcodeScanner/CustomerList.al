pageextension 99100 "Customer List" extends "Customer List"
{
    layout
    {
    }
    actions
    {
        addlast(processing)
        {
            action(Barcode)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = page "PRI-GKM Barcode Scanner";

            }
        }
    }
}