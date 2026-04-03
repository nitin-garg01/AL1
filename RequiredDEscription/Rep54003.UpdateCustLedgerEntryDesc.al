report 54003 "Update Cust Ledger Entry Desc."
{
    Caption = 'Update Cust Ledger Entry Desc.';
    ProcessingOnly = true;
    ApplicationArea = all;
    UsageCategory = Administration;
    Permissions = TableData "G/L Entry" = rimd;
    dataset
    {
        dataitem(RequiredDescriptionTable; "Required Description Table")
        {
            RequestFilterHeading = 'Change Description Report';
            RequestFilterFields = "Entry No.";
            trigger OnAfterGetRecord()
            var
                CustLedgerEntry: Record "Cust. Ledger Entry";
                GLEntry: Record "G/L Entry";
            begin
                CustLedgerEntry.Reset();
                CustLedgerEntry.SetRange("Entry No.", RequiredDescriptionTable."Entry No.");
                if CustLedgerEntry.FindFirst() then begin
                    CustLedgerEntry.Description := RequiredDescriptionTable."Required Description";
                    CustLedgerEntry.Modify();
                end;
                GLEntry.Reset();
                GLEntry.SetRange("Transaction No.", CustLedgerEntry."Transaction No.");
                if GLEntry.FindSet() then
                    repeat
                        GLEntry.Description := RequiredDescriptionTable."Required Description";
                        GLEntry.Modify();
                    until GLEntry.Next() = 0;
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
    trigger OnPreReport()
    begin
        Message('This report will update the Description field in the Cust. Ledger Entry and G/L Entry tables based on the Entry No Of Required Description Table.');
    end;
}
