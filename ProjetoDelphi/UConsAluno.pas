unit UConsAluno;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, System.JSON,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.StdCtrls, FMX.Objects, FMX.Controls.Presentation,
  FMX.Layouts, System.Rtti, System.Bindings.Outputs, FMX.Bind.Editors,
  Data.Bind.EngExt, FMX.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope,
  FMX.Memo.Types, FMX.ScrollBox, FMX.Memo;

type
  TFrmConsAluno = class(TForm)
    Layout1: TLayout;
    Layout2: TLayout;
    RoundRect2: TRoundRect;
    Label5: TLabel;
    ListView1: TListView;
    RoundRect3: TRoundRect;
    RoundRect4: TRoundRect;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    BtnAlterar: TSpeedButton;
    Image2: TImage;
    BtnExcluir: TSpeedButton;
    Image3: TImage;
    procedure FormShow(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure ListView1ItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure BtnExcluirClick(Sender: TObject);
  private
    { Private declarations }
    gerajson: string;
    jsonobj: TJSONObject;

  public
    { Public declarations }
    op, cod: string;
  end;

var
  FrmConsAluno: TFrmConsAluno;

implementation

{$R *.fmx}

uses UModulo, UCadAluno;

procedure TFrmConsAluno.BtnAlterarClick(Sender: TObject);
begin
  FrmCadAluno.show;
end;

procedure TFrmConsAluno.BtnExcluirClick(Sender: TObject);
begin
  op := 'd';
  FrmCadAluno.SobeDadoAluno;
end;

procedure TFrmConsAluno.FormShow(Sender: TObject);
begin
  gerajson := '{"op":"s","alucodigo":"","alunnome":"","codigopro":""}';
  dm.RESTRequest1.Resource := '/aluno.php?json={parametro}';
  dm.RESTRequest1.Params.AddUrlSegment('parametro', gerajson);
  dm.RESTRequest1.Execute;
end;

procedure TFrmConsAluno.ListView1ItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
  cod := dm.AlunoALUCODIGO.AsString;
  FrmCadAluno.op := 'u';
  FrmCadAluno.cod := dm.AlunoALUCODIGO.AsString;
  FrmCadAluno.EdtNome.Text := dm.AlunoALUNNOME.AsString;
  FrmCadAluno.procodigo := dm.ProjetoPROCODIGO.asstring;
end;

end.
