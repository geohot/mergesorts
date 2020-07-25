with Ada.Text_IO;
use Ada.Text_IO;

procedure Mergesort is

   type List_T is array (Integer range <>) of Integer;
   Jumbled_List : List_T := (5,9,1,3,4,6,6,3,2);
   Sorted_List  : List_T := (0 .. 8 => 0);

   function Merge (Left, Right : List_T) return List_T is
      Result       : List_T (Left'First .. Right'Last);
      Left_Index   : Integer := Left'First;
      Right_Index  : Integer := Right'First;
      Result_Index : Integer := Result'First;
   begin
      while Left_Index <= Left'Last and Right_Index <= Right'Last loop
         if Left (Left_Index) <= Right (Right_Index)
         then
            Result (Result_Index) := Left (Left_Index);
            Left_Index := Integer'Succ (Left_Index);
         else
            Result (Result_Index) := Right (Right_Index);
            Right_Index := Integer'Succ (Right_Index);
         end if;
         Result_Index := Integer'Succ (Result_Index);
      end loop;

      if Left_Index <= Left'Last then
         Result (Result_Index .. Result'Last) := Left (Left_Index .. Left'Last);
      end if;

      if Right_Index <= Right'Last then
         Result (Result_Index .. Result'Last) := Right (Right_Index .. Right'Last);
      end if;

      return Result;
   end Merge;

   function Sort (List : List_T) return List_T is
      Result : List_T (List'Range);
      Middle : Integer;
   begin
      if List'Length <= 1 then
         return List;
      else
         Middle := (List'Length / 2) + List'First;
         declare
            Left : List_T (List'First .. Integer'Pred (Middle));
            Right : List_T (Middle .. List'Last);
         begin
            for I in Left'Range loop
               Left (I) := List (I);
            end loop;

            for I in Right'Range loop
               Right (I) := List (I);
            end loop;

            Left := Sort (Left);
            Right := Sort (Right);
            Result := Merge (Left, Right);
         end;

         return Result;
      end if;
   end Sort;

begin
   Sorted_List := Sort (Jumbled_List);

   for I in Sorted_List'Range loop
      Put (Integer'Image (Sorted_List (I)));
   end loop;
end Mergesort;
