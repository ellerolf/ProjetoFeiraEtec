unit UCadAluno;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,System.JSON,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.StdCtrls, FMX.DateTimeCtrls, FMX.Edit, FMX.Controls.Presentation,
  FMX.Layouts;

type
  TFrmCadAluno = class(TForm)
    Layout1: TLayout;
    Label1: TLabel;
    EdtCpf: TEdit;
    EdtNome: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    EdtData: TDateEdit;
    RoundRect1: TRoundRect;
    BtnSalvar: TSpeedButton;
    Image1: TImage;
    Layout2: TLayout;
    RoundRect2: TRoundRect;
    Label5: TLabel;
    procedure BtnSalvarClick(Sender: TObject);
  private
    { Private declarations }
    jsonobj: TJSONObject;
    gerajson: string;

  public
    { Public declarations }
    op: string;
    cod: string;
  end;

var
  FrmCadAluno: TFrmCadAluno;

implementation

{$R *.fmx}

procedure TFrmCadAluno.BtnSalvarClick(Sender: TObject);
begin
  {jsonobj := TJSONObject.Create;
  jsonobj.AddPair('op', op);
  jsonobj.AddPair('alucodigo', cod);
  jsonobj.AddPair('', op);}

end;

end.
