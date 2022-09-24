unit UConsProjetos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.StdCtrls, FMX.Objects, FMX.Controls.Presentation,
  FMX.Layouts, System.Rtti, System.Bindings.Outputs, FMX.Bind.Editors,
  Data.Bind.EngExt, FMX.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope,
  FMX.Memo.Types, FMX.ScrollBox, FMX.Memo;

type
  TFrmConsProjeto = class(TForm)
    Layout1: TLayout;
    Layout2: TLayout;
    RoundRect2: TRoundRect;
    Label5: TLabel;
    RoundRect3: TRoundRect;
    ListView1: TListView;
    RoundRect4: TRoundRect;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    BtnAlterar: TSpeedButton;
    Image2: TImage;
    BtnExcluir: TSpeedButton;
    Image3: TImage;
    LinkFillControlToField: TLinkFillControlToField;
    Memo1: TMemo;
    procedure FormShow(Sender: TObject);
    procedure ListView1ItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure BtnAlterarClick(Sender: TObject);
  private
    { Private declarations }
    gerajson: string;
  public
    { Public declarations }
  end;

var
  FrmConsProjeto: TFrmConsProjeto;

implementation

{$R *.fmx}

uses UModulo, UCadProjeto;

procedure TFrmConsProjeto.BtnAlterarClick(Sender: TObject);
begin
  FrmCadProjeto.Show;
end;

procedure TFrmConsProjeto.FormShow(Sender: TObject);
begin
  gerajson := '{"op":"s","procodigo":"","pronome":"","proeixo":""}';
  dm.RESTRequest1.Resource := '/projeto.php?json={parametro}';
  dm.RESTRequest1.Params.AddUrlSegment('parametro', gerajson);
  dm.RESTRequest1.Execute;

end;

procedure TFrmConsProjeto.ListView1ItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
  FrmCadProjeto.op := 'u';
  FrmCadProjeto.cod := dm.ProjetoPROCODIGO.AsString;
  FrmCadProjeto.EdtNome.Text := dm.ProjetoPRONOME.AsString;
  FrmCadProjeto.CboEixo.ItemIndex := FrmCadProjeto.CboEixo.Items.IndexOf
    (dm.ProjetoPROEIXO.AsString);
end;

end.
