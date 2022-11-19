unit UConsUsuario;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.Objects, FMX.StdCtrls, FMX.Controls.Presentation,
  FMX.Layouts, System.Rtti, System.Bindings.Outputs, FMX.Bind.Editors,
  Data.Bind.EngExt, FMX.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope;

type
  TFrmConsUsuario = class(TForm)
    Layout1: TLayout;
    Layout2: TLayout;
    RoundRect2: TRoundRect;
    Label5: TLabel;
    RoundRect3: TRoundRect;
    ListView1: TListView;
    RoundRect4: TRoundRect;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    BtnAlterar: TSpeedButton;
    Image2: TImage;
    BtnExcluir: TSpeedButton;
    Image3: TImage;
    procedure FormShow(Sender: TObject);
    procedure ListView1ItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
  private
    { Private declarations }
    gerajson: string;
  public
    { Public declarations }
    cod, op: string;
  end;

var
  FrmConsUsuario: TFrmConsUsuario;

implementation

{$R *.fmx}

uses UModulo, UCadUsuario;

procedure TFrmConsUsuario.BtnAlterarClick(Sender: TObject);
begin
  FrmCadUsuario.Show;
end;

procedure TFrmConsUsuario.BtnExcluirClick(Sender: TObject);
begin
  op := 'd';
  FrmCadUsuario.SobeDadoUsuario;
end;

procedure TFrmConsUsuario.FormShow(Sender: TObject);
begin
  gerajson :=
    '{"op":"s","usucodigo":"","usucpf":"","usunome":"","usudtnasc":"","usutipo":""}';
  dm.RESTRequest1.Resource := '/usuario.php?json={parametro}';
  dm.RESTRequest1.Params.AddUrlSegment('parametro', gerajson);
  dm.RESTRequest1.Execute;
end;

procedure TFrmConsUsuario.ListView1ItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
  FrmCadUsuario.op := 'u';
  FrmCadUsuario.cod := dm.UsuarioUSUCODIGO.AsString;
  FrmCadUsuario.EdtCpf.Text := dm.UsuarioUSUCPF.AsString;
  FrmCadUsuario.EdtNome.Text := dm.UsuarioUSUNOME.AsString;
  FrmCadUsuario.DtaDataNasc.Date := dm.UsuarioUSUDTNASC.AsDateTime;
  FrmCadUsuario.CboTipo.ItemIndex := FrmCadUsuario.CboTipo.Items.IndexOf
    (dm.UsuarioUSUTIPO.AsString);
end;

end.
