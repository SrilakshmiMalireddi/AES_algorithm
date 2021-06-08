
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity roundlast is
Port ( roundlastinput : in  STD_LOGIC_VECTOR (127 downto 0);
       keylastinput : in  STD_LOGIC_VECTOR (127 downto 0);
		 waste: in std_logic_vector(7 downto 0);
       roundlastoutput : out  STD_LOGIC_VECTOR (127 downto 0));
end roundlast;

architecture Behavioral of roundlast is

component subbytes is
    Port ( p_in : in  STD_LOGIC_VECTOR (127 downto 0);
           s_out : out  STD_LOGIC_VECTOR (127 downto 0));
end component;

component shiftrows is
    Port ( a : in  STD_LOGIC_VECTOR (127 downto 0);
           c : out  STD_LOGIC_VECTOR (127 downto 0));
end component;

component KeyGenerator is
Port ( a  :in  STD_LOGIC_VECTOR (127 downto 0);
           rcon  :  in  STD_LOGIC_VECTOR (7 downto 0);
           b  :  out  STD_LOGIC_VECTOR (127 downto 0));
end component;

signal subout,shiftout,keyout:std_logic_vector(127 downto 0);
begin

q1: KeyGenerator port map (keylastinput,waste,keyout);

q2:subbytes port map(roundlastinput,subout);
	
q3:shiftrows  port map(subout,shiftout);

roundlastoutput <= shiftout xor keyout;


end Behavioral;