unit UAtribuicao;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, System.JSON,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.Objects, FMX.StdCtrls, FMX.ListView, FMX.Edit, FMX.Controls.Presentation,
  FMX.Layouts, Data.Bind.EngExt, FMX.Bind.DBEngExt, System.Rtti,
  System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.Components,
  Data.Bind.DBScope;

type
  TFrmAtribuicao = class(TForm)
    Layout1: TLayout;
    Layout2: TLayout;
    RoundRect2: TRoundRect;
    Label5: TLabel;
    RoundRect1: TRoundRect;
    ListView1: TListView;
    ListView2: TListView;
    PnlProj1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    LblProj1: TLabel;
    LblProjeto1: TLabel;
    Label7: TLabel;
    PnlProj2: TPanel;
    LblProj2: TLabel;
    LblProjeto2: TLabel;
    Label11: TLabel;
    PnlProj3: TPanel;
    LblProj3: TLabel;
    LblProjeto3: TLabel;
    Label16: TLabel;
    PnlProj4: TPanel;
    LblProj4: TLabel;
    LblProjeto4: TLabel;
    Label21: TLabel;
    Layout5: TLayout;
    BtnSalvar: TSpeedButton;
    Image1: TImage;
    RoundRect3: TRoundRect;
    RoundRect4: TRoundRect;
    BtnAdd1: TSpeedButton;
    Image2: TImage;
    BtnAdd2: TSpeedButton;
    Image3: TImage;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    BindSourceDB2: TBindSourceDB;
    LinkListControlToField1: TLinkListControlToField;
    LinkListControlToField2: TLinkListControlToField;
    Label4: TLabel;
    LblProfessor1: TLabel;
    BindSourceDB3: TBindSourceDB;
    LinkPropertyToFieldText: TLinkPropertyToField;
    LinkPropertyToFieldText2: TLinkPropertyToField;
    LinkPropertyToFieldText3: TLinkPropertyToField;
    LinkPropertyToFieldText4: TLinkPropertyToField;
    LinkPropertyToFieldText5: TLinkPropertyToField;
    procedure FormShow(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure ListView1ItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
  private
    { Private declarations }
    gerajson, gerajson2, gerajson3: string;
    jsonobj: TJSONObject;
  public
    op, cod:string;
    { Public declarations }
  end;

var
  FrmAtribuicao: TFrmAtribuicao;

implementation

{$R *.fmx}

uses UModulo;

procedure TFrmAtribuicao.FormShow(Sender: TObject);
begin
  gerajson :=
    '{"op":"s","usucodigo":"","usucpf":"","usunome":"","usudtnasc":"","usutipo":""}';
  dm.RESTRequest1.Resource := '/usuario.php?json={parametro}';
  dm.RESTRequest1.Params.AddUrlSegment('parametro', gerajson);
  dm.RESTRequest1.Execute;

  dm.RDProjeto.Response:=dm.RESTResponse2;
  gerajson2 := '{"op":"s","procodigo":"","pronome":"","proeixo":""}';
  dm.RESTRequest2.Resource := '/projeto.php?json={parametro}';
  dm.RESTRequest2.Params.AddUrlSegment('parametro', gerajson2);
  dm.RESTRequest2.Execute;

  dm.RDControle.Response:=dm.RESTResponse3;
  gerajson3 := '{"op":"s","concodigo":"0","codigousu":"1","proj1":"2","proj2":"3","proj3":"4","proj4":"5"}';
  dm.RESTRequest3.Resource := '/controle.php?json={parametro}';
  dm.RESTRequest3.Params.AddUrlSegment('parametro', gerajson3);
  dm.RESTRequest3.Execute;
end;

procedure TFrmAtribuicao.Image3Click(Sender: TObject);
begin
 try
   //{"op":"i","concodigo":"0","codigousu":"1","proj1":"2","proj2":"3","proj3":"4","proj4":"5"}
   {jsonobj:=TJSONObject.Create;
   jsonobj.AddPair('op', op);
   jsonobj.AddPair('concodigo', cod);
   jsonobj.AddPair('codigousu', );
   jsonobj.AddPair('proj1',);
   jsonobj.AddPair('proj2',);
   jsonobj.AddPair('proj3',);
   jsonobj.AddPair('proj4',);}
 finally
   jsonobj.DisposeOf;
 end;
end;

procedure TFrmAtribuicao.ListView1ItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
 LblProfessor1.Text:=dm.UsuarioUSUNOME.AsString;
end;

end.
