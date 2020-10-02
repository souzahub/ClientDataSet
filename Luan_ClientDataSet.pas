unit Luan_ClientDataSet;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.DBClient,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs;

type
  TForm1 = class(TForm)
    insert: TButton;
    remove: TButton;
    edit: TButton;
    i_name: TEdit;
    grid1: TDBGrid;
    Label1: TLabel;
    ds1: TDataSource;
    cds: TClientDataSet;
    DBGrid2: TDBGrid;
    Label2: TLabel;
    con: TFDConnection;
    query: TFDQuery;
    ds2: TDataSource;
    cdsNAME: TStringField;
    cdsID: TFDAutoIncField;
    Button1: TButton;
    Label3: TLabel;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure insertClick(Sender: TObject);
    procedure editClick(Sender: TObject);
    procedure removeClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure queryAfterExecute(DataSet: TFDDataSet);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  grid1.Enabled := false;
  cds.First;

  while not cds.Eof do
  begin
    query.ExecSQL( 'INSERT INTO ITENS (NOME) VALUES (:n)',[ cds.FieldByName('name').AsString ] );
    cds.Next;
  end;

  query.Refresh;

  grid1.Enabled := true;

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  cds.EmptyDataSet;
end;

procedure TForm1.editClick(Sender: TObject);
var id: Integer;
begin
  if edit.Tag = 0 then
  begin
    id := cds.FieldByName('ID').AsInteger;
    i_name.Text := cds.FieldByName('name').AsString;
    i_name.Color := clInfoBk;
    edit.Tag := 1;
  end
  else
  begin
    cds.Locate('id',id,[]);

    cds.Edit;
    cds.FieldByName('name').AsString := i_name.Text;
    cds.Post;

    edit.Tag := 0;
    i_name.Color := clWhite;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  con.Connected := true;
  query.ExecSQL('CREATE TABLE IF NOT EXISTS ITENS ( NOME VARCHAR(50), ID INTEGER PRIMARY KEY AUTOINCREMENT )');
  query.ExecSQL('DELETE FROM ITENS');

  cds.CreateDataSet;
  cds.Open;
end;

procedure TForm1.insertClick(Sender: TObject);
begin
  cds.Insert;
  cds.FieldByName('NAME').AsString := i_name.Text;
  cds.Post;
end;

procedure TForm1.queryAfterExecute(DataSet: TFDDataSet);
begin
  query.Open('SELECT * FROM ITENS ORDER BY ID DESC');
end;

procedure TForm1.removeClick(Sender: TObject);
var i: Integer;
begin

  i := cds.FieldByName('id').AsInteger;
  cds.Delete;

  if not cds.Locate('id',i-1,[]) then
    cds.Locate('id',i+1,[]);

end;

end.
