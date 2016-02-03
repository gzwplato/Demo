program UltiboDemoRPi;

{Ultibo demo project for Raspberry Pi (A/B/A+/B+/Zero)                         }
{                                                                              }
{For the Raspberry Pi 2B version see the file UltiboDemoRPi2.lpr               }
{                                                                              }
{To compile this project select Build, Run from the Lazarus menu               }

{$mode delphi} {Default to Delphi compatible syntax}
{$H+}          {Default to AnsiString}

uses
 RaspberryPi,
 GlobalConfig,
 GlobalConst,
 Platform,
 Threads,
 DemoMain,
 Logging,
 Console,
 ConsoleShell;
 
begin
 {Initialize the Demo}
 if InitDemo then
  begin
   {Run the Demo}
   RunDemo;
   
   {When we return start the Console shell}
   CONSOLE_SHELL_ENABLED:=True;
   CONSOLE_SHELL_POSITION:=CONSOLE_POSITION_TOPRIGHT;
   ConsoleShellDeviceAdd(ConsoleDeviceGetDefault);
   
   {And start the Console logging}
   CONSOLE_REGISTER_LOGGING:=True;
   CONSOLE_LOGGING_POSITION:=CONSOLE_POSITION_BOTTOMRIGHT;
   LoggingConsoleDeviceAdd(ConsoleDeviceGetDefault);
   LoggingDeviceSetDefault(LoggingDeviceFindByType(LOGGING_TYPE_CONSOLE));
   LoggingOutput('This is a log window, try connecting a USB device');
  end;
  
 {Halt the Main thread if it ever returns here}
 ThreadHalt(0); 
end.