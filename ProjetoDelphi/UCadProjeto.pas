unit UCadProjeto;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, System.JSON,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.StdCtrls, FMX.DateTimeCtrls, FMX.Edit, FMX.Controls.Presentation,
  FMX.Layouts, FMX.ListBox, FMX.Memo.Types, FMX.ScrollBox, FMX.Memo;

type
  TFrmCadProjeto = class(TForm)
    Layout1: TLayout;
    Label1: TLabel;
    EdtNome: TEdit;
    RoundRect1: TRoundRect;
    BtnSalvar: TSpeedButton;
    Image1: TImage;
    Layout2: TLayout;
    RoundRect2: TRoundRect;
    Label5: TLabel;
    Label3: TLabel;
    CboEixo: TComboBox;
    Memo1: TMemo;
    procedure SpeedButton1Click(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
  private
    { Private declarations }
    jsonobj: TJSONObject;
    gerajson: string;
  public
    { Public declarations }
    cod, op: string;
  end;

var
  FrmCadProjeto: TFrmCadProjeto;

implementation

{$R *.fmx}

uses UCadEixo, UModulo;

procedure TFrmCadProjeto.BtnSalvarClick(Sender: TObject);
begin
  try
    jsonobj := TJSONObject.Create;
    jsonobj.AddPair('op', op);
    jsonobj.AddPair('procodigo', cod);
    jsonobj.AddPair('pronome', EdtNome.text);
    jsonobj.AddPair('proeixo', CboEixo.Selected.text);
    gerajson := jsonobj.ToString;
    Memo1.Text:= gerajson;

    dm.RESTRequest1.Resource := '/projeto.php?json={parametro}';
    dm.RESTRequest1.Params.AddUrlSegment('parametro', gerajson);
    dm.RESTRequest1.Execute;

    EdtNome.text := '';
    CboEixo.ItemIndex := -1;
    ShowMessage('Gravado');

  finally
    jsonobj.DisposeOf;
  end;
end;

procedure TFrmCadProjeto.SpeedButton1Click(Sender: TObject);
begin
  FrmCadEixo.Show;
end;

end.
