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
    // Точка старта
    StartX, StartY: integer;
    // Защита от повторного запуска
    isRun: boolean;
    { Public declarations }
implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Shape1.Left := Shape1.Left + GraphX;
  Shape1.Top := Shape1.Top - GraphY;
  // Инициализация переменных старта
  StartX := Shape1.Left;
  StartY := Shape1.Top;
  // Автоматически присваивает текст
  Label1.Caption := IntToStr(ScrollBar1.Position) + ' градусов';
  Label2.Caption := IntToStr(ScrollBar2.Position) + ' м/с';
  // ?????????
  isRun := false;
end;

procedure TForm1.ScrollBar1Change(Sender: TObject);
begin
  Label1.Caption := IntToStr(ScrollBar1.Position) + ' градусов';
end;

procedure TForm1.ScrollBar2Change(Sender: TObject);
begin
  Label2.Caption := IntToStr(ScrollBar2.Position) + ' м/с';
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  // Точка старта
  X0, Y0: integer;
  // Текущие координаты
  X, Y: Real;
  // Начальная скорость, угол, две проекции, время, ускорение
  V0, A, Vx, Vy, t, g: Real;
begin
  // Защита от дурака
  if isRun then
    exit;
  isRun := True;
  // Заливаем все белым цветом
  Image1.Canvas.FillRect(Image1.ClientRect);
  // Устанавливаем точку старта
  X0 := GraphX + Shape1.Width div 2;
  Y0 := Image1.Height - GraphY - (Shape1.Height div 2);
  // Инициализация стартовых координат
  X := X0;
  Y := Y0;
  // Считываем угол
  A := ScrollBar1.Position;
  // Считываем начальную скорость
  V0 := ScrollBar2.Position;
  // Ускорение
  g := 9.8;
  // Проекции скоростей
  Vx := Round(V0 * cos(Pi * A / 180)*1000)/1000;
  Vy := Round(V0 * sin(Pi * A / 180)*1000)/1000;
  // Инициализация времени
  t := 0;
  // Переходим к старту
  Image1.Canvas.MoveTo(X0, Y0);
  // Устанавливаем цвет
  Image1.Canvas.Pen.Color := clRed;
  // Проверяем условие выхода за пределы
  while (X >= 0) and (X <= Image1.Width) and (Y >= 0)  do
  begin
    // Смещаем время
    t := t + 0.05;
    // Устанавливаем координату X
    X := Vx * t;
    // Устанавливаем координату Y
    Y := (Vy * t - g * t * t / 2);
    // Перемещаем окружность
    Shape1.Top := StartY - round(Y);
    Shape1.Left := StartX + round(X);
    // Рисуем график
    Image1.Canvas.LineTo(round(X0 + X), round(Y0 - Y));
    // Запускаем отрисовку
    Application.ProcessMessages;
    // Пауза, эффект времени
    sleep(10);
  end;
  // Разрешаем последующий запуск
  isRun := false;

end;

end.
