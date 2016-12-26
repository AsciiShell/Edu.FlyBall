unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    ScrollBar1: TScrollBar;
    ScrollBar2: TScrollBar;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Image1: TImage;
    Shape1: TShape;
    procedure FormCreate(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure ScrollBar2Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
  { Public declarations }

  end;

var
  Form1: TForm1;
  const
    GraphX = 50;
    GraphY = 20;

  var
    // ����� ������
    StartX, StartY: integer;
    // ������ �� ���������� �������
    isRun: boolean;
    { Public declarations }
implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Shape1.Left := Shape1.Left + GraphX;
  Shape1.Top := Shape1.Top - GraphY;
  // ������������� ���������� ������
  StartX := Shape1.Left;
  StartY := Shape1.Top;
  // ������������� ����������� �����
  Label1.Caption := IntToStr(ScrollBar1.Position) + ' ��������';
  Label2.Caption := IntToStr(ScrollBar2.Position) + ' �/�';
  // ?????????
  isRun := false;
end;

procedure TForm1.ScrollBar1Change(Sender: TObject);
begin
  Label1.Caption := IntToStr(ScrollBar1.Position) + ' ��������';
end;

procedure TForm1.ScrollBar2Change(Sender: TObject);
begin
  Label2.Caption := IntToStr(ScrollBar2.Position) + ' �/�';
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  // ����� ������
  X0, Y0: integer;
  // ������� ����������
  X, Y: Real;
  // ��������� ��������, ����, ��� ��������, �����, ���������
  V0, A, Vx, Vy, t, g: Real;
begin
  // ������ �� ������
  if isRun then
    exit;
  isRun := True;
  // �������� ��� ����� ������
  Image1.Canvas.FillRect(Image1.ClientRect);
  // ������������� ����� ������
  X0 := GraphX + Shape1.Width div 2;
  Y0 := Image1.Height - GraphY - (Shape1.Height div 2);
  // ������������� ��������� ���������
  X := X0;
  Y := Y0;
  // ��������� ����
  A := ScrollBar1.Position;
  // ��������� ��������� ��������
  V0 := ScrollBar2.Position;
  // ���������
  g := 9.8;
  // �������� ���������
  Vx := Round(V0 * cos(Pi * A / 180)*1000)/1000;
  Vy := Round(V0 * sin(Pi * A / 180)*1000)/1000;
  // ������������� �������
  t := 0;
  // ��������� � ������
  Image1.Canvas.MoveTo(X0, Y0);
  // ������������� ����
  Image1.Canvas.Pen.Color := clRed;
  // ��������� ������� ������ �� �������
  while (X >= 0) and (X <= Image1.Width) and (Y >= 0)  do
  begin
    // ������� �����
    t := t + 0.05;
    // ������������� ���������� X
    X := Vx * t;
    // ������������� ���������� Y
    Y := (Vy * t - g * t * t / 2);
    // ���������� ����������
    Shape1.Top := StartY - round(Y);
    Shape1.Left := StartX + round(X);
    // ������ ������
    Image1.Canvas.LineTo(round(X0 + X), round(Y0 - Y));
    // ��������� ���������
    Application.ProcessMessages;
    // �����, ������ �������
    sleep(10);
  end;
  // ��������� ����������� ������
  isRun := false;

end;

end.
