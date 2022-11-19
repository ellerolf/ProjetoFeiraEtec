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
    Layout2: TLayout;
    Label5: TLabel;
    RoundRect2: TRoundRect;
    BtnSalvar: TSpeedButton;
    Image1: TImage;
    procedure BtnSalvarClick(Sender: TObject);
    procedure SobeDadoUsuario;
  private
    { Private declarations }
    jsonobj: TJSONObject;
    datainicial: TDateTime;
    gerajson: string;
  public
    { Public declarations }
    cod, op: string;
  end;

var
  FrmCadUsuario: TFrmCadUsuario;

implementation

{$R *.fmx}

uses UCadAluno, UModulo, UCadEixo, UConsUsuario;

procedure TFrmCadUsuario.BtnSalvarClick(Sender: TObject);
var
  conferir: integer;
begin
  if (op = 'i') then
  begin
    conferir := Length(EdtCpf.Text);
    datainicial := IncMonth(now, (18 * -12));
    if ((EdtCpf.Text = '') or (EdtNome.Text = '') or (CboTipo.ItemIndex = 0))
    then
    begin
      ShowMessage('Campos obrigatorios vazio, verifique!');
    end
    else if (conferir <> 11) then
    begin
      ShowMessage('Cpf Invalido');
    end
    else if (DtaDataNasc.DateTime > datainicial) then
    begin
      ShowMessage('Data de aniversario incorreta');
    end
    else
    begin
      SobeDadoUsuario;
    end;
  end
  else if (op = 'u') then
  begin
    // o que tenho que fazer para condição para cair no else
    if ((EdtCpf.Text <> dm.UsuarioUSUCPF.Value) or
      (EdtNome.Text <> dm.UsuarioUSUNOME.Value) or
      (CboTipo.ItemIndex <> strtoint(dm.UsuarioUSUTIPO.Value)) or
      (DtaDataNasc.DateTime <> dm.UsuarioUSUDTNASC.Value)) then
    begin
      SobeDadoUsuario;
      // como faço para que a list view seja carregada novamente, tentei chamar a procedure da list mas da erro;
    end
    else
    begin
      ShowMessage('Dados iguais, não é posivel alterar');
    end;

  end;

end;

procedure TFrmCadUsuario.SobeDadoUsuario;
begin
  try

    begin
      jsonobj := TJSONObject.Create;
      jsonobj.AddPair('op', op);
      jsonobj.AddPair('usucodigo', cod);
      jsonobj.AddPair('usunome', EdtNome.Text);
      jsonobj.AddPair('usucpf', EdtCpf.Text);
      jsonobj.AddPair('usudtnasc', FormatDateTime('yyyy-mm-dd',
        DtaDataNasc.Date));
      jsonobj.AddPair('usutipo', CboTipo.Selected.Text);
      gerajson := jsonobj.ToString;

      dm.RESTRequest1.Resource := '/usuario.php?json={parametro}';
      dm.RESTRequest1.Params.AddUrlSegment('parametro', gerajson);
      dm.RESTRequest1.Execute;

      EdtNome.Text := '';
      EdtCpf.Text := '';
      DtaDataNasc.Date := now;
      CboTipo.ItemIndex := -1;
      ShowMessage('Dados Gravados');
    end;

  finally
    jsonobj.DisposeOf;
  end;
end;

end.
