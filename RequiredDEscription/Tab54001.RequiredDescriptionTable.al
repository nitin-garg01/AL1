table 54001 "Required Description Table"
{
    Caption = 'Required Description Table';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; "Required Description"; Text[250])
        {
            Caption = 'Required Description';
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}
