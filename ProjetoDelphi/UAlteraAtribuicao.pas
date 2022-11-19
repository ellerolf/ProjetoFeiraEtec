unit UAlteraAtribuicao;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, System.JSON,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.Objects, FMX.StdCtrls, FMX.ListView, FMX.Edit, FMX.Controls.Presentation,
  FMX.Layouts, Data.Bind.EngExt, FMX.Bind.DBEngExt, System.Rtti,
  System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.Components,
  Data.Bind.DBScope, FMX.Memo.Types, FMX.ScrollBox, FMX.Memo;

type
  TFrmAlteraAtribuicao = class(TForm)
    Layout1: TLayout;
    Layout2: TLayout;
    RoundRect2: TRoundRect;
    Label5: TLabel;
    RoundRect1: TRoundRect;
    LstProfessor: TListView;
    LstProjeto: TListView;
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
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    BindSourceDB2: TBindSourceDB;
    LinkListControlToField2: TLinkListControlToField;
    Label4: TLabel;
    BindSourceDB3: TBindSourceDB;
    LinkPropertyToFieldText: TLinkPropertyToField;
    LinkPropertyToFieldText2: TLinkPropertyToField;
    LinkPropertyToFieldText3: TLinkPropertyToField;
    LinkPropertyToFieldText4: TLinkPropertyToField;
    LinkListControlToField1: TLinkListControlToField;
    BtnSalvar: TSpeedButton;
    Image1: TImage;
    LblProfessor1: TLabel;
    RoundRect3: TRoundRect;
    BtnEmergencia: TSpeedButton;
    Image2: TImage;
    Panel1: TPanel;
    BtnLimparProf: TSpeedButton;
    BtnLimparP1: TSpeedButton;
    BtnLimparP2: TSpeedButton;
    BtnLimparP3: TSpeedButton;
    BtnLimparP4: TSpeedButton;
    RoundRect4: TRoundRect;
    BtnLimpaTudo: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure LstProfessorItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure BtnEmergenciaClick(Sender: TObject);
    procedure LstProjetoItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure Image3Click(Sender: TObject);
    procedure BtnLimparProfClick(Sender: TObject);
    procedure BtnLimparP1Click(Sender: TObject);
    procedure BtnLimparP2Click(Sender: TObject);
    procedure BtnLimparP3Click(Sender: TObject);
    procedure BtnLimparP4Click(Sender: TObject);
    procedure BtnLimpaTudoClick(Sender: TObject);
    procedure SobeDadoAtrib;
  private
    { Private declarations }
    gerajson, gerajson2, gerajson3, gerajson4: string;
    jsonobj: TJSONObject;
    usuario, p1, p2, p3, p4, i: Integer;

  public
    op, cod: string;
    { Public declarations }
  end;

var
  FrmAlteraAtribuicao: TFrmAlteraAtribuicao;

implementation

{$R *.fmx}

uses UModulo;

procedure TFrmAlteraAtribuicao.BtnEmergenciaClick(Sender: TObject);
begin
  op := 'u';
  // Up
  PnlProj4.Visible := True;
end;

procedure TFrmAlteraAtribuicao.BtnLimparP1Click(Sender: TObject);
begin
  LblProjeto1.Text := '';
  i := 1;
end;

procedure TFrmAlteraAtribuicao.BtnLimparP2Click(Sender: TObject);
begin
  LblProjeto2.Text := '';
  i := 2;
end;

procedure TFrmAlteraAtribuicao.BtnLimparP3Click(Sender: TObject);
begin
  LblProjeto3.Text := '';
  i := 3;
end;

procedure TFrmAlteraAtribuicao.BtnLimparP4Click(Sender: TObject);
begin
  LblProjeto4.Text := '';
  i := 4;
end;

procedure TFrmAlteraAtribuicao.BtnLimparProfClick(Sender: TObject);
begin
  LblProfessor1.Text := '';
  i := 1;
end;

procedure TFrmAlteraAtribuicao.BtnLimpaTudoClick(Sender: TObject);
begin
  LblProfessor1.Text := '';
  LblProjeto1.Text := '';
  LblProjeto2.Text := '';
  LblProjeto3.Text := '';
  LblProjeto4.Text := '';
  i := 1;
end;

procedure TFrmAlteraAtribuicao.BtnSalvarClick(Sender: TObject);
begin

  if op = 'i' then
  begin
    if ((LblProfessor1.Text = '') or (LblProjeto1.Text = '') or
      (LblProjeto2.Text = '') or (LblProjeto3.Text = '')) then
    begin
      ShowMessage('Cadastro não realizado, campos faltando');
    end
    else
    begin
      SobeDadoAtrib;
    end;
  end;
  if ((op = 'u') or (i=4)) then
  begin
    LblProfessor1.Text := dm.ControleUSUNOME.Value;
    LblProjeto1.Text := inttostr(dm.ControlePROJ1.Value);
    LblProjeto2.Text := inttostr(dm.ControlePROJ2.Value);
    LblProjeto3.Text := inttostr(dm.ControlePROJ3.Value);

    if ((LblProfessor1.Text <> dm.ControleUSUNOME.Value) or
      (LblProjeto1.Text <> inttostr(dm.ControlePROJ1.Value)) or
      (LblProjeto2.Text <> inttostr(dm.ControlePROJ2.Value)) or
      (LblProjeto3.Text <> inttostr(dm.ControlePROJ3.Value)) or
      (LblProjeto4.Text <> inttostr(dm.ControlePROJ4.Value))) then
    begin
      try
        begin
          // {"op":"i","concodigo":"0","codigousu":"1","proj1":"2","proj2":"3","proj3":"4","proj4":"5"}
          jsonobj := TJSONObject.Create;
          jsonobj.AddPair('op', op);
          jsonobj.AddPair('concodigo', cod);
          jsonobj.AddPair('codigousu', inttostr(usuario));
          jsonobj.AddPair('proj1', inttostr(p1));
          jsonobj.AddPair('proj2', inttostr(p2));
          jsonobj.AddPair('proj3', inttostr(p3));
          jsonobj.AddPair('proj4', inttostr(p4));
          gerajson := jsonobj.ToString;

          dm.RESTRequest1.Resource := '/controle.php?json={parametro}';
          dm.RESTRequest1.Params.AddUrlSegment('parametro', gerajson);
          dm.RESTRequest1.Execute;

          ShowMessage('Dados Gravados');
        end;

      finally
        jsonobj.DisposeOf;
      end;

    end
    else
    begin
      ShowMessage('Cadastro não realizado, campos faltando');
    end;
  end;

end;

procedure TFrmAlteraAtribuicao.FormShow(Sender: TObject);
begin
  // PnlProj4.Enabled := False;
  i := 1;
  // para usuario
  gerajson :=
    '{"op":"s","usucodigo":"0","usucpf":"","usunome":"","usudtnasc":"","usutipo":""}';
  dm.RESTRequest1.Resource := '/usuario.php?json={parametro}';
  dm.RESTRequest1.Params.AddUrlSegment('parametro', gerajson);
  dm.RESTRequest1.Execute;
  // para projeto
  dm.RDProjeto.Response := dm.RESTResponse2;
  gerajson2 := '{"op":"s","procodigo":"","pronome":"","proeixo":""}';
  dm.RESTRequest2.Resource := '/projeto.php?json={parametro}';
  dm.RESTRequest2.Params.AddUrlSegment('parametro', gerajson2);
  dm.RESTRequest2.Execute;
  // para controle
  dm.RDControle.Response := dm.RESTResponse3;
  gerajson3 :=
    '{"op":"s","concodigo":"0","codigousu":"1","proj1":"2","proj2":"3","proj3":"4","proj4":"5"}';
  dm.RESTRequest3.Resource := '/controle.php?json={parametro}';
  dm.RESTRequest3.Params.AddUrlSegment('parametro', gerajson3);
  dm.RESTRequest3.Execute;

  LblProfessor1.Text := '';
  LblProjeto1.Text := '';
  LblProjeto2.Text := '';
  LblProjeto3.Text := '';
  LblProjeto4.Text := '';
  i := 1;
end;

procedure TFrmAlteraAtribuicao.Image3Click(Sender: TObject);
begin
  LblProjeto1.Text := '';
end;

procedure TFrmAlteraAtribuicao.LstProfessorItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
  LblProfessor1.Text := dm.UsuarioUSUCODIGO.AsString + ' - ' +
    dm.UsuarioUSUNOME.AsString;
  usuario := dm.UsuarioUSUCODIGO.AsInteger;
  // ShowMessage(USUCODIGO);
end;

procedure TFrmAlteraAtribuicao.LstProjetoItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
  // para que cada projeto receba um dado
  if (i = 1) then
  begin
    p1 := dm.ProjetoPROCODIGO.AsInteger;
    LblProjeto1.Text := dm.ProjetoPRONOME.AsString;
    // ShowMessage(inttostr(p1));
  end
  else if (i = 2) then
  begin
    p2 := dm.ProjetoPROCODIGO.AsInteger;
    LblProjeto2.Text := dm.ProjetoPRONOME.AsString;
    // ShowMessage(inttostr(p2));
  end
  else if (i = 3) then
  begin
    p3 := dm.ProjetoPROCODIGO.AsInteger;
    LblProjeto3.Text := dm.ProjetoPRONOME.AsString;
    // ShowMessage(inttostr(p3));
  end
  else if (i = 4) then
  begin
    p4 := dm.ProjetoPROCODIGO.AsInteger;
    LblProjeto4.Text := dm.ProjetoPRONOME.AsString;
    // ShowMessage(inttostr(p4));
  end
  else
  begin
    ShowMessage('chega')
  end;

  i := i + 1;
end;

procedure TFrmAlteraAtribuicao.SobeDadoAtrib;
begin
  try
    begin
      // {"op":"i","concodigo":"0","codigousu":"1","proj1":"2","proj2":"3","proj3":"4","proj4":"5"}
      jsonobj := TJSONObject.Create;
      jsonobj.AddPair('op', op);
      jsonobj.AddPair('concodigo', cod);
      jsonobj.AddPair('codigousu', inttostr(usuario));
      jsonobj.AddPair('proj1', inttostr(p1));
      jsonobj.AddPair('proj2', inttostr(p2));
      jsonobj.AddPair('proj3', inttostr(p3));
      jsonobj.AddPair('proj4', '');
      gerajson := jsonobj.ToString;

      dm.RESTRequest1.Resource := '/controle.php?json={parametro}';
      dm.RESTRequest1.Params.AddUrlSegment('parametro', gerajson);
      dm.RESTRequest1.Execute;

      ShowMessage('Dados Gravados');
    end;

  finally
    jsonobj.DisposeOf;
  end;
end;

end.
