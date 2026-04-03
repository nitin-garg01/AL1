page 54002 "Required Description List Page"
{
    ApplicationArea = All;
    Caption = 'Required Description List Page';
    PageType = List;
    SourceTable = "Required Description Table";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the value of the Entry No. field.', Comment = '%';
                }
                field("Required Description"; Rec."Required Description")
                {
                    ToolTip = 'Specifies the value of the Required Description field.', Comment = '%';
                }
            }
        }
    }
}
