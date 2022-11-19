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
    Layout2: TLayout;
    RoundRect2: TRoundRect;
    Label5: TLabel;
    Label3: TLabel;
    CboEixo: TComboBox;
    BtnSalvar: TSpeedButton;
    Image1: TImage;
    procedure SpeedButton1Click(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure SobeDadoProjeto;
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
  if op = 'i' then
  begin
    if ((EdtNome.Text = '') or (CboEixo.ItemIndex = 0)) then
    begin
      ShowMessage('Campos faltando, favor conferir');
    end
    else
    begin
      SobeDadoProjeto;
    end;
  end;
  if op = 'u' then
  begin
    if ((EdtNome.Text <> dm.ProjetoPRONOME.Value) or
      (CboEixo.ItemIndex <> Strtoint(dm.ProjetoPROEIXO.Value))) then
    begin
      SobeDadoProjeto;
    end
    else
    begin
      ShowMessage('Campos faltando, favor conferir');
    end;
  end;

end;

procedure TFrmCadProjeto.SobeDadoProjeto;
begin
  try
    jsonobj := TJSONObject.Create;
    jsonobj.AddPair('op', op);
    jsonobj.AddPair('procodigo', cod);
    jsonobj.AddPair('pronome', EdtNome.Text);
    jsonobj.AddPair('proeixo', CboEixo.Selected.Text);
    gerajson := jsonobj.ToString;

    dm.RESTRequest1.Resource := '/projeto.php?json={parametro}';
    dm.RESTRequest1.Params.AddUrlSegment('parametro', gerajson);
    dm.RESTRequest1.Execute;

    EdtNome.Text := '';
    CboEixo.ItemIndex := -1;
    ShowMessage('Dados Gravados');

  finally
    jsonobj.DisposeOf;
  end;
end;

procedure TFrmCadProjeto.SpeedButton1Click(Sender: TObject);
begin
  FrmCadEixo.Show;
end;

end.
