with Ada.Characters.Latin_1;
with Ada.Strings.Fixed;
with Ada.Streams;

package HTTP is

   use Ada.Characters.Latin_1;

   Terminator : constant String := CR & LF;
   Status_Line : constant String := "HTTP/1.1 200 OK" & Terminator;
   Header_Field_HTML : constant String := "Content-Type: text/html; charset=UTF-8" & Terminator;

   package Methods is
      type Method is (Option, Get, Head, Post, Put, Delete, Trace, Connect, Unknown);
   end;

   type Request_Line is record
      Method_Text : String (1 .. Methods.Method'Width) := (others => NUL);
      URI_Text : String (1 .. 100) := (others => NUL);
      HTTP_Version_Text : String (1 .. 100) := (others => NUL);
   end record;

   procedure Read_Line (Stream : not null access Ada.Streams.Root_Stream_Type'Class; Item : out String; P : in out Natural);
   procedure Read_Request_Line (Stream : not null access Ada.Streams.Root_Stream_Type'Class; R : out Request_Line);
   procedure Put (R : Request_Line);

   procedure Read_File (Filename : String; Item : out String);

end HTTP;
