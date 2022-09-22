unit UCadUsuario;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, System.JSON,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.StdCtrls, FMX.ListBox, FMX.DateTimeCtrls, FMX.Edit,
  FMX.Controls.Presentation, FMX.Layouts, FMX.ScrollBox, FMX.Memo,
  FMX.Memo.Types;

type
  TFrmCadUsuario = class(TForm)
    Layout1: TLayout;
    Label1: TLabel;
    EdtCpf: TEdit;
    EdtNome: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    DtaDataNasc: TDateEdit;
    Label4: TLabel;
    CboTipo: TComboBox;
    RoundRect1: TRoundRect;
    BtnSalvar: TSpeedButton;
    Image1: TImage;
    Layout2: TLayout;
    Label5: TLabel;
    RoundRect2: TRoundRect;
    Memo1: TMemo;
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
  FrmCadUsuario: TFrmCadUsuario;

implementation

{$R *.fmx}

uses UCadAluno, UModulo, UCadEixo;

procedure TFrmCadUsuario.BtnSalvarClick(Sender: TObject);
begin
  try
    jsonobj := TJSONObject.Create;
    jsonobj.AddPair('op', op);
    jsonobj.AddPair('usucodigo', cod);
    jsonobj.AddPair('usunome', EdtNome.Text);
    jsonobj.AddPair('usucpf', EdtCpf.Text);
    jsonobj.AddPair('usudtnasc', FormatDateTime('yyyy-mm-dd',
      DtaDataNasc.Date));
    jsonobj.AddPair('usutipo', CboTipo.Selected.Text);
    gerajson := jsonobj.ToString;
    Memo1.Text := gerajson;
    dm.RESTRequest1.Resource := '/usuario.php?json={parametro}';
    dm.RESTRequest1.Params.AddUrlSegment('parametro', gerajson);
    dm.RESTRequest1.Execute;
    EdtNome.Text := '';
    EdtCpf.Text := '';
    DtaDataNasc.Date := now;
    CboTipo.ItemIndex := -1;
    showmessage('Registro salvo com sucesso');
  finally
    jsonobj.DisposeOf;
  end;
end;

end.
