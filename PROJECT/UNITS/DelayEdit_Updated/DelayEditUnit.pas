unit DelayEditUnit;

interface
  uses cxEdit, cxSpinEdit, cxVariants, cxMaskEdit, Classes, cxDataUtils,
       SyncObjs, cxContainer, math, Controls;

type
  TDelay = record
    Hours : integer;
    Minutes : integer;
  end;

  TcxDelayEditProperties = class(TcxCustomMaskEditProperties)
  private
    FCS : TCriticalSection;
    FDigits : Integer;
    FDefaultFocusedDisplayValue : string;
    function GetDigits: Integer;
    procedure SetDigits(const Value: Integer);
  protected
    procedure UpdateEditMask; reintroduce;
    function DefaultFocusedDisplayValue: TcxEditValue; override;

  public
    constructor Create(AOwner: TPersistent); override;
    destructor Destroy; override;
    function IsDisplayValueValid(var DisplayValue: TcxEditValue; AEditFocused: Boolean): Boolean; override;
    function IsEditValueValid( var EditValue: TcxEditValue;
                               AEditFocused: Boolean): Boolean; override;
    class function GetContainerClass: TcxContainerClass; override;
    function GetEditValueSource(AEditFocused: Boolean): TcxDataEditValueSource; override;
    procedure PrepareDisplayValue(const AEditValue: TcxEditValue; var DisplayValue: TcxEditValue;
      AEditFocused: Boolean); override;
    procedure ValidateDisplayValue(var ADisplayValue: TcxEditValue;
      var AErrorText: TCaption; var AError: Boolean;
      AEdit: TcxCustomEdit); override;
  published
    property Alignment;
    property AssignedValues;
    property AutoSelect;
    property BeepOnError;
    property ClearKey;
    property HideSelection;
    property ImeMode;
    property ImeName;
    property ImmediatePost;
    property ReadOnly;
    property UseLeftAlignmentOnEditing;
    property ValidateOnEnter;
    property OnChange;
    property OnEditValueChanged;
    property OnValidate;
    property Digits : Integer read GetDigits write SetDigits stored True;
  end;


  TcxDelayEdit = class(TcxCustomMaskEdit)
  private
    function GetDelay: TDelay;
    procedure SetDelay(const Value: TDelay);
    function GetProperties: TcxDelayEditProperties;
    procedure SetProperties(const Value: TcxDelayEditProperties);
    function GetActiveProperties: TcxDelayEditProperties;

  protected
    procedure Initialize; override;
    function GetDigits():Integer;
  public
    procedure PrepareEditValue(const ADisplayValue: TcxEditValue;
          out EditValue: TcxEditValue; AEditFocused: Boolean); override;

    procedure SynchronizeDisplayValue; override;
    procedure SynchronizeEditValue; override;

    class function GetPropertiesClass: TcxCustomEditPropertiesClass; override;
    property ActiveProperties: TcxDelayEditProperties read GetActiveProperties;

  published
    property Delay: TDelay read GetDelay write SetDelay stored False;

    property Anchors;
    property AutoSize;
    property BeepOnEnter;
    property Constraints;
    property DragMode;
    property EditValue;
    property Enabled;
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property Properties: TcxDelayEditProperties read GetProperties write SetProperties;
    property ShowHint;
    property Style;
    property StyleDisabled;
    property StyleFocused;
    property StyleHot;
    property TabOrder;
    property TabStop;
    property Visible;
    property DragCursor;
    property DragKind;
    property ImeMode;
    property ImeName;
    property OnClick;
{$IFDEF DELPHI5}
    property OnContextPopup;
{$ENDIF}
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEditing;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
    property OnEndDock;
    property OnStartDock;
  end;

  TcxFilterDelayEditHelper = class(TcxFilterSpinEditHelper)
  protected
    class procedure InitializeEdit(AEdit: TcxCustomEdit;
      AEditProperties: TcxCustomEditProperties); override;
  public
    class function GetFilterEditClass: TcxCustomEditClass; override;
  end;

  { TcxEditRepositoryDelayItem }

  TcxEditRepositoryDelayItem = class(TcxEditRepositoryItem)
  private
    function GetProperties: TcxDelayEditProperties;
    procedure SetProperties(Value: TcxDelayEditProperties);
  public
    class function GetEditPropertiesClass: TcxCustomEditPropertiesClass; override;
  published
    property Properties: TcxDelayEditProperties read GetProperties write SetProperties;
  end;

implementation
uses StrUtils, SysUtils, Variants, Dialogs, DateUtils, cxFilterControlUtils;

const
  sFormat = '%.3u:%.2u';

function GetDelayForDateTime( ADateTime : TDateTime ): TDelay;
  var
    ADelay : TDelay;
    Hours : Integer;
    Minutes : Integer;
begin
  Hours := Trunc(MinuteSpan( 0, ADateTime)) div 60;
  Minutes := round(MinuteSpan( 0, ADateTime)) mod 60;

  ADelay.Hours := Hours;
  ADelay.Minutes := Minutes;
  result := ADelay;
end;

function DisplayToDelay( s: string ): TDelay;
begin
  result.Minutes := StrToIntDef(RightStr( S, 2), 0);
  result.Hours := StrToIntDef(LeftStr( S, Length(S)-3), 0);
end;

function StrToDelay( S : string ): TDelay;
  var
    ADouble : Double;
begin
  if TryStrToFloat( S, ADouble ) then
    result := GetDelayForDateTime(TDateTime(ADouble));
end;


function DelayToDateTime( ADelay : TDelay ): TDateTime;
begin
  result := (ADelay.Hours + (ADelay.Minutes / 60.0)) / 24.0;
end;

{ TcxDelayEdit }


function TcxDelayEdit.GetDelay: TDelay;
var
  AValue: TcxEditValue;
  ADelay : TDelay;
begin
  Result := ADelay;
  if Focused then
  begin
    PrepareEditValue(DisplayValue, AValue, True);
    Result := GetDelayForDateTime(VarAsType(AValue, varDate));
  end
  else
    if VarIsStr(EditValue) then
      Result := GetDelayForDateTime(StrToDateTime(EditValue))
    else
    begin
      Result := GetDelayForDateTime(VarAsType(EditValue, varDate));
    end;
end;

procedure TcxDelayEdit.SetDelay(const Value: TDelay);
begin
  InternalEditValue := DelayToDateTime(Value);
end;

procedure TcxDelayEdit.PrepareEditValue(const ADisplayValue: TcxEditValue;
  out EditValue: TcxEditValue; AEditFocused: Boolean);
var
  AText: string;
  AValue: Double;
begin
  if VarIsNull(ADisplayValue) or (Trim(ADisplayValue)='') then
    AText := ActiveProperties.DefaultFocusedDisplayValue
  else
    AText := ADisplayValue;
    
  AValue := 0;
  try
    try
      if AText <> '' then
        AValue := DelayToDateTime(DisplayToDelay(AText));
    except
      AValue := 0;
    end
  finally
    EditValue := AValue;
  end;
  if EditValue <> 0 then
    EditValue := VarAsType(EditValue, varDate);
end;

function TcxDelayEdit.GetProperties: TcxDelayEditProperties;
begin
  Result := TcxDelayEditProperties(FProperties);
end;

procedure TcxDelayEdit.SetProperties(const Value: TcxDelayEditProperties);
begin
  FProperties.Assign(Value);
end;

function TcxDelayEdit.GetActiveProperties: TcxDelayEditProperties;
begin
 Result := TcxDelayEditProperties(InternalGetActiveProperties);
end;

class function TcxDelayEdit.GetPropertiesClass: TcxCustomEditPropertiesClass;
begin
  result := TcxDelayEditProperties;
end;

procedure TcxDelayEdit.SynchronizeDisplayValue;
  var
    ADelay : TDelay;
    ADisplayValue : Variant;
begin
  inherited SynchronizeDisplayValue; exit;
  if VarIsNull( EditValue ) then
    SetInternalDisplayValue(ActiveProperties.DefaultFocusedDisplayValue)
  else if VarIsDate(EditValue) then begin
    ADelay := GetDelayForDateTime(EditValue);
    ADisplayValue := Format( sFormat, [ADelay.Hours, ADelay.Minutes]);
    SetInternalDisplayValue(ADisplayValue);
  end else
    SetInternalDisplayValue(ActiveProperties.DefaultFocusedDisplayValue);
end;

procedure TcxDelayEdit.SynchronizeEditValue;
begin
  inherited SynchronizeEditValue; exit;
  SetInternalEditValue( DelayToDateTime(DisplayToDelay( DisplayValue )) );
end;

procedure TcxDelayEdit.Initialize;
begin
  inherited Initialize;
  InternalEditValue := 0;
end;

function TcxDelayEdit.GetDigits: Integer;
begin
  result := ActiveProperties.Digits;
end;

{ TcxDelayEditProperties }

function TcxDelayEditProperties.IsDisplayValueValid(
  var DisplayValue: TcxEditValue; AEditFocused: Boolean): Boolean;
var
  AText: string;
  ADelay : TDelay;
begin
  AText := VarToStr(DisplayValue);
  Result := True;
  try
    ADelay := StrToDelay(AText);
    DisplayValue := Format( sFormat, [ADelay.Hours, ADelay.Minutes]);
  except
    Result := False;
  end;
end;

function TcxDelayEditProperties.DefaultFocusedDisplayValue: TcxEditValue;
begin
  FCS.Enter;
  try
    Result := FDefaultFocusedDisplayValue;
  finally
    FCS.Leave;
  end;
end;

procedure TcxDelayEditProperties.UpdateEditMask;
  var
    i :Integer;
    FEditMask : String;
begin
  BeginUpdate;
  try
    FCS.Enter;
    try
      FEditMask := '';
      FDefaultFocusedDisplayValue := '';
      for i := 0 to FDigits-1 do begin
        FEditMask := FEditMask + '\d';
        FDefaultFocusedDisplayValue := FDefaultFocusedDisplayValue + '0';
      end;
      FEditMask := FEditMask + ':[0-5]\d';
      FDefaultFocusedDisplayValue := FDefaultFocusedDisplayValue + ':00';
      MaskKind := emkRegExprEx;
      EditMask := FEditMask;
    finally
      FCS.Leave;
    end;
  finally
    EndUpdate;
  end;
end;

procedure TcxDelayEditProperties.PrepareDisplayValue(
  const AEditValue: TcxEditValue; var DisplayValue: TcxEditValue;
  AEditFocused: Boolean);
  var
    ADelay : TDelay;
    AHoursMax: Integer;
begin
  if VarIsNull(AEditValue) then
    DisplayValue := DefaultFocusedDisplayValue
  else if VarIsDate(AEditValue) then begin
    ADelay := GetDelayForDateTime(AEditValue);
    AHoursMax := Round(IntPower(10, Digits)) - 1;
    if AEditFocused and (ADelay.Hours > AHoursMax) then
      ADelay.Hours := AHoursMax;
    DisplayValue := Format( sFormat, [ADelay.Hours, ADelay.Minutes]);
  end else
    DisplayValue := DefaultFocusedDisplayValue;
end;

procedure TcxDelayEditProperties.ValidateDisplayValue(var ADisplayValue: TcxEditValue;
  var AErrorText: TCaption; var AError: Boolean; AEdit: TcxCustomEdit);
var
  I: Integer;
begin
  if Length(ADisplayValue) < Digits then
  begin
    for I := 1 to Digits - Length(ADisplayValue) do
      ADisplayValue := ADisplayValue + '0';
    ADisplayValue := ADisplayValue + ':';
  end;
  for I := 1 to Length(FDefaultFocusedDisplayValue) - Length(ADisplayValue) do
    ADisplayValue := ADisplayValue + '0';
  inherited ValidateDisplayValue(ADisplayValue, AErrorText, AError, AEdit);
end;

constructor TcxDelayEditProperties.Create(AOwner: TPersistent);
begin
  inherited;
  FCS := TCriticalSection.Create;
  AlwaysShowBlanksAndLiterals := True;
  ValidateOnEnter := True;
  SetDigits( 3 );
end;

function TcxDelayEditProperties.IsEditValueValid(var EditValue: TcxEditValue;
  AEditFocused: Boolean): Boolean;
begin
  result := VarIsDate(EditValue) or VarIsNull(EditValue) or VarIsNumericEx(EditValue) and (EditValue = 0);
end;

class function TcxDelayEditProperties.GetContainerClass: TcxContainerClass;
begin
  Result := TcxDelayEdit;
end;

function TcxDelayEditProperties.GetEditValueSource(
  AEditFocused: Boolean): TcxDataEditValueSource;
begin
  result := evsValue;
end;

function TcxDelayEditProperties.GetDigits: Integer;
begin
  result := FDigits;
end;

procedure TcxDelayEditProperties.SetDigits(const Value: Integer);
begin
  if FDigits <> Value then begin
    FDigits := Value;
    UpdateEditMask;
    Changed;
  end;
end;

destructor TcxDelayEditProperties.Destroy;
begin
  FreeAndNil(FCS);
  inherited;
end;

{ TcxFilterDelayEditHelper }

class procedure TcxFilterDelayEditHelper.InitializeEdit(AEdit: TcxCustomEdit;
  AEditProperties: TcxCustomEditProperties);
  var
    ADelay : TDelay;
begin
  inherited InitializeEdit(AEdit, AEditProperties);
  ADelay.Hours := 0;
  ADelay.Minutes := 0;

  TcxDelayEdit(AEdit).Delay := ADelay;
end;

class function TcxFilterDelayEditHelper.GetFilterEditClass: TcxCustomEditClass;
begin
  Result := TcxDelayEdit;
end;

{ TcxEditRepositoryDelayItem }

function TcxEditRepositoryDelayItem.GetProperties: TcxDelayEditProperties;
begin
  Result := inherited Properties as TcxDelayEditProperties;
end;

class function TcxEditRepositoryDelayItem.GetEditPropertiesClass: TcxCustomEditPropertiesClass;
begin
  Result := TcxDelayEditProperties;
end;

procedure TcxEditRepositoryDelayItem.SetProperties(
  Value: TcxDelayEditProperties);
begin
  inherited Properties := Value;
end;

initialization
  RegisterClasses([TcxDelayEdit, TcxEditRepositoryDelayItem]);
  GetRegisteredEditProperties.Register(TcxDelayEditProperties, 'DelayEdit|Editeur de temps');
  FilterEditsController.Register(TcxDelayEditProperties, TcxFilterDelayEditHelper);
finalization
  FilterEditsController.Unregister(TcxDelayEditProperties, TcxFilterDelayEditHelper);
  GetRegisteredEditProperties.Unregister(TcxDelayEditProperties);

end.
