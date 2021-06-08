--AES final project

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AES is
Port ( clk : in  STD_LOGIC;
       input,enckey : in  STD_LOGIC_VECTOR (127 downto 0);
       output : out  STD_LOGIC_VECTOR (127 downto 0) );

end AES;

architecture Behavioral of AES is

component rounds is
Port ( roundin : in  STD_LOGIC_VECTOR (127 downto 0);
           keyin : in  STD_LOGIC_VECTOR (127 downto 0);
			  keyout : inout  STD_LOGIC_VECTOR (127 downto 0);
			  garbage: in std_logic_vector (7 downto 0);
           roundout : out  STD_LOGIC_VECTOR (127 downto 0));
end component;

component roundlast is
Port ( roundlastinput : in  STD_LOGIC_VECTOR (127 downto 0);
       keylastinput : in  STD_LOGIC_VECTOR (127 downto 0);
		 waste: in std_logic_vector (7 downto 0);
       roundlastoutput : out  STD_LOGIC_VECTOR (127 downto 0));
end component;

signal preround : std_logic_vector (127 downto 0);
signal k1,k2,k3,k4,k5,k6,k7,k8,k9 : std_logic_vector (127 downto 0);
signal r1,r2,r3,r4,r5,r6,r7,r8,r9 : std_logic_vector (127 downto 0);
signal fout : STD_LOGIC_VECTOR (127 downto 0);


begin
preround <= input xor enckey;

o1: rounds port map(preround,enckey,k1,x"01",r1);

o2: rounds port map(r1,k1,k2,x"02",r2);

o3: rounds port map(r2,k2,k3,x"04",r3);

o4: rounds port map(r3,k3,k4,x"08",r4);

o5: rounds port map(r4,k4,k5,x"10",r5);

o6: rounds port map(r5,k5,k6,x"20",r6);

o7: rounds port map(r6,k6,k7,x"40",r7);

o8: rounds port map(r7,k7,k8,x"80",r8);

o9: rounds port map(r8,k8,k9,x"1b",r9);

o10: roundlast port map(r9,k9,x"36",fout);

output <= fout (127 downto 0);
end Behavioral;