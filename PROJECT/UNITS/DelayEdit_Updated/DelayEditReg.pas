unit DelayEditReg;

interface

  procedure Register;

implementation

uses DelayEditUnit, cxEditRepositoryEditor, Classes, cxEdit, cxFilterControlUtils;

procedure Register;
begin
  RegisterComponents( 'DelayEdit', [TcxDelayEdit] );
  RegisterNoIcon([TcxEditRepositoryDelayItem]);
  RegisterEditRepositoryItem( TcxEditRepositoryDelayItem, 'DelayEdit|Editeur de temps' );
end;


end.
