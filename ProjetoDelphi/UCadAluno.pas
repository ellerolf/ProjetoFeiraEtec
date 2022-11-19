unit UCadAluno;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, System.JSON,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.StdCtrls, FMX.DateTimeCtrls, FMX.Edit, FMX.Controls.Presentation,
  FMX.Layouts, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, System.Rtti,
  System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.EngExt,
  FMX.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, FMX.Memo.Types,
  FMX.ScrollBox, FMX.Memo;

type
  TFrmCadAluno = class(TForm)
    Layout1: TLayout;
    EdtNome: TEdit;
    Label2: TLabel;
    RoundRect1: TRoundRect;
    Layout2: TLayout;
    RoundRect2: TRoundRect;
    Label5: TLabel;
    ListView1: TListView;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    BtnSalvar: TSpeedButton;
    Image1: TImage;
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ListView1ItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure SobeDadoAluno;
  private
    { Private declarations }
    jsonobj: TJSONObject;
    gerajson: string;

  public
    { Public declarations }
    op: string;
    cod: string;
    procodigo: string;
  end;

var
  FrmCadAluno: TFrmCadAluno;

implementation

{$R *.fmx}

uses UModulo;

procedure TFrmCadAluno.BtnSalvarClick(Sender: TObject);
begin
  if (op = 'i') then
  begin
    if ((EdtNome.Text = '') or (procodigo = '')) then
    begin
      ShowMessage('Cadastro não realizado, campos faltando');
    end
    else
    begin
      SobeDadoAluno;
    end;
  end;

  if (op = 'u') then
  begin
    if ((EdtNome.Text <> dm.AlunoALUNNOME.Value) or
      (procodigo <> inttostr(dm.AlunoCODIGOPRO.Value))) then
    begin
      SobeDadoAluno;
    end
    else
    begin
      ShowMessage('Cadastro não realizado, campos faltando');
    end;

  end;
end;

procedure TFrmCadAluno.FormShow(Sender: TObject);
var
  jsnpro: string;
begin
  dm.RDProjeto.Response := dm.RESTResponse2;
  jsnpro := '{"op":"s","procodigo":"0","pronome":"","proeixo":"1"}';
  dm.RESTRequest2.Resource := '/projeto.php?json={parametro}';
  dm.RESTRequest2.Params.AddUrlSegment('parametro', jsnpro);
  dm.RESTRequest2.Execute;
end;

procedure TFrmCadAluno.ListView1ItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
  // codigo que vem da listView
  procodigo := dm.ProjetoPROCODIGO.Asstring;
end;

procedure TFrmCadAluno.SobeDadoAluno;
begin
  try
    // "op":"s","alucodigo":"0","alunnome":"ANA JÚLIA MARTINS ZANATA","codigopro":"5"
    jsonobj := TJSONObject.Create;
    jsonobj.AddPair('op', op);
    jsonobj.AddPair('alucodigo', cod);
    jsonobj.AddPair('alunnome', EdtNome.Text);
    // subir para o banco com o codigo da tabela de origem
    jsonobj.AddPair('codigopro', procodigo);
    gerajson := jsonobj.ToString;

    dm.RESTRequest1.Resource := '/aluno.php?json={parametro}';
    dm.RESTRequest1.Params.AddUrlSegment('parametro', gerajson);
    dm.RESTRequest1.Execute;

    ShowMessage('Dados Gravados')
  finally
    jsonobj.DisposeOf;
  end;
end;

end.
