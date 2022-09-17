unit UCadEixo;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, System.JSON,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.StdCtrls, FMX.DateTimeCtrls, FMX.Edit, FMX.Controls.Presentation,
  FMX.Layouts;

type
  TFrmCadEixo = class(TForm)
    Layout1: TLayout;
    EdtNome: TEdit;
    Label2: TLabel;
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
  FrmCadEixo: TFrmCadEixo;

implementation

{$R *.fmx}

uses UModulo;

procedure TFrmCadEixo.BtnSalvarClick(Sender: TObject);
begin
  try

    jsonobj := TJSONObject.Create;
    jsonobj.AddPair('op', op);
    jsonobj.AddPair('eixcodigo', cod);
    jsonobj.AddPair('eixonome', EdtNome.Text);
    dm.RESTRequest1.Resource := '/eixo.php?json={parametro}';
    dm.RESTRequest1.Params.AddUrlSegment('parametro',gerajson);
    dm.RESTRequest1.Execute;
    EdtNome.Text:='';
    showmessage('Registro salvo com sucesso');
  finally
    jsonobj.DisposeOf;
  end;
end;

end.
