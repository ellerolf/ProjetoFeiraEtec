unit URelProjetos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, System.JSON,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  FMX.Grid.Style, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Grid,
  Data.Bind.EngExt, FMX.Bind.DBEngExt, FMX.Bind.Grid, System.Bindings.Outputs,
  FMX.Bind.Editors, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope,
  FMX.Printer, FMX.Objects, FMX.StdCtrls, FMX.Memo.Types, FMX.Memo, FMX.Menus;

type
  Tfrmrelprojetos = class(TForm)
    Grid1: TGrid;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    PopupMenu1: TPopupMenu;
    MenuItem1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
  private
    { Private declarations }
    gerajson3: string;
    jsonobj: TJSONObject;
  public
    { Public declarations }
  end;

var
  frmrelprojetos: Tfrmrelprojetos;

implementation

{$R *.fmx}

uses UModulo, Word2000, ComObj;

procedure Tfrmrelprojetos.FormShow(Sender: TObject);
begin
  // para controle
  dm.RDControle.Response := dm.RESTResponse3;
  gerajson3 :=
    '{"op":"st","concodigo":"0","codigousu":"","proj1":"2","proj2":"3","proj3":"4","proj4":"5"}';
  dm.RESTRequest3.Resource := '/controle.php?json={parametro}';
  dm.RESTRequest3.Params.AddUrlSegment('parametro', gerajson3);
  dm.RESTRequest3.Execute;
end;

procedure Tfrmrelprojetos.MenuItem1Click(Sender: TObject);
begin
  try
    begin
      // {"op":"i","concodigo":"0","codigousu":"1","proj1":"2","proj2":"3","proj3":"4","proj4":"5"}
      jsonobj := TJSONObject.Create;
      jsonobj.AddPair('op', 'd');
      jsonobj.AddPair('concodigo', dm.ControleCONCODIGO.AsString);
      jsonobj.AddPair('codigousu', '');
      jsonobj.AddPair('proj1', '');
      jsonobj.AddPair('proj2', '');
      jsonobj.AddPair('proj3', '');
      jsonobj.AddPair('proj4', '');
      gerajson3 := jsonobj.ToString;

      dm.RESTRequest3.Resource := '/controle.php?json={parametro}';
      dm.RESTRequest3.Params.AddUrlSegment('parametro', gerajson3);
      dm.RESTRequest3.Execute;

      ShowMessage('Registro Excluído');

      dm.RDControle.Response := dm.RESTResponse3;
      gerajson3 :=
        '{"op":"st","concodigo":"0","codigousu":"","proj1":"2","proj2":"3","proj3":"4","proj4":"5"}';
      dm.RESTRequest3.Resource := '/controle.php?json={parametro}';
      dm.RESTRequest3.Params.AddUrlSegment('parametro', gerajson3);
      dm.RESTRequest3.Execute;

    end;

  finally
    jsonobj.DisposeOf;
  end;
end;

end.
